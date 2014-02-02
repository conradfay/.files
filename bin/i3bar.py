#!/usr/bin/env python3

import time
import sys
import subprocess
import json
import select


class ConStatus():
    widgets = {}
    status = []  # JSON encoding of status
    clickEvents = False

    def __init__(self, widgets):
        self.widgets = widgets

    def add_widgets(self, widgets):
        self.widgets.append(widgets)

    def update(self):
        self.status = []

        # Check for click events
        clickEvent = self.check_stdin()

        # Update widgets
        for widget in self.widgets:
            widget.update()

            if clickEvent and clickEvent['name'] is widget.name:
                widget.click()

            self.status.append({
                'name': widget.name,
                'full_text': widget.text,
                'color': widget.color
            })

    def check_stdin(self):
        stdin = ''
        if select.select([sys.stdin], [], [], 0.0)[0]:
            stdin = sys.stdin.readline()
            try:
                json_object = json.loads(stdin)
                return json_object
            except ValueError:
                return {}
        return {}

    def status_string(self):
        return json.dumps(self.status) + ','

    def header_string(self):
        header = {
            "version": 1,
            "click_events": self.clickEvents
        }

        return json.dumps(header) + '[[],'

    def write_header_to_stdout(self):
        sys.stdout.write(self.header_string())
        sys.stdout.flush()  # Flush stdout, otherwise won't work.

    def write_status_to_stdout(self):
        sys.stdout.write(self.status_string())
        sys.stdout.flush()  # Flush stdout, otherwise won't work.


class State():
    COMPACT = 1
    CLICKED = 2


class BarWidget():
    name = '[unnamed_widget]'
    text = '[no_text]'
    color = '#FFFFFF'

    def update(self):
        pass

    def click(self):
        pass


class TextWidget(BarWidget):
    # Just placeholder for now.
    pass


# Colors
RED = '#b85335'
LIGHT_RED = '#cf6a4c'
LIGHT_BLUE = '#8197bf'
LIGHT_CYAN = '#8fBfdc'
LIGHT_GREEN = '#99ad6a'
YELLOW = '#fad07a'
LIGHT_GREY = '#cccccc'


# Custom Widgets
class BatWidget(TextWidget):
    name = 'bat'
    color = LIGHT_BLUE

    def update(self):
        BAT_PART_UNICODE = '\u2b91'
        BAT_PLUGGED_UNICODE = '\u2b8e'
        BAT_FULL_UNICODE = '\u2b92'

        text = ''
        if 'Charging' in self.__bat_stats():
            text = BAT_PART_UNICODE + ' +' + self.__bat_level()
        elif 'Discharging' in self.__bat_stats():
            text = BAT_PART_UNICODE + ' -' + self.__bat_level()
        else:
            text = BAT_PLUGGED_UNICODE

        self.text = text.rstrip()

    def __bat_stats(self):
        acpi = subprocess.Popen(
            ['acpi', '--battery'],
            stdout=subprocess.PIPE)

        cut = subprocess.Popen(
            ['cut', '-d', ' ', '-f3'],
            stdin=acpi.stdout,
            stdout=subprocess.PIPE
        )

        sed = subprocess.Popen(
            ['sed', 's/,//'],
            stdin=cut.stdout,
            stdout=subprocess.PIPE
        )

        stdout, err = sed.communicate()

        return stdout.decode(encoding='UTF-8')

    def __bat_level(self):
        acpi = subprocess.Popen(
            ['acpi', '--battery'],
            stdout=subprocess.PIPE)

        cut = subprocess.Popen(
            ['cut', '-d', ' ', '-f4'],
            stdin=acpi.stdout,
            stdout=subprocess.PIPE
        )

        sed = subprocess.Popen(
            ['sed', 's/%,//'],
            stdin=cut.stdout,
            stdout=subprocess.PIPE
        )

        stdout, err = sed.communicate()

        return stdout.decode(encoding='UTF-8')

    def click(self):
        self.text = 'click'


class DateWidget(TextWidget):
    name = 'date'
    color = YELLOW

    def update(self):
        text = ''
        CLOCK_UNICODE = '\u2b67'

        date = subprocess.Popen(
            ['date', '+%a %m/%d/%y %R:%S'],
            stdout=subprocess.PIPE)

        stdout, err = date.communicate()

        dateStr = stdout.decode(encoding='UTF-8')

        text = CLOCK_UNICODE + ' ' + dateStr

        self.text = text.rstrip()


class VolWidget(TextWidget):
    name = 'vol'
    color = LIGHT_RED

    def update(self):
        text = ''
        SPEAKER_UNICODE = '\u2b9e'
        HEADPHONE_UNICODE = '\u2b9c'
        MUTE_UNICODE = '\u2b9d'
        if 'on' in self.__headphone_status():
            text = HEADPHONE_UNICODE + ' ' + self.__vol_level()
        elif 'on' in self.__speaker_status() and 'off' in self.__headphone_status():
            text = SPEAKER_UNICODE + ' ' + self.__vol_level()
        else:
            text = MUTE_UNICODE

        self.text = text.rstrip()

    def __speaker_status(self):
        amixer = subprocess.Popen(
            ['amixer', 'get', 'Master'],
            stdout=subprocess.PIPE)

        tail = subprocess.Popen(
            ['tail', '-n', '1'],
            stdin=amixer.stdout,
            stdout=subprocess.PIPE)

        cut = subprocess.Popen(
            ['cut', '-d', '[', '-f', '3'],
            stdin=tail.stdout,
            stdout=subprocess.PIPE)

        sed = subprocess.Popen(
            ['sed', 's/].*//g'],
            stdin=cut.stdout,
            stdout=subprocess.PIPE)

        stdout, err = sed.communicate()

        return stdout.decode(encoding='UTF-8')

    def __headphone_status(self):
        amixer = subprocess.Popen(
            ['amixer', '-c', '0', 'contents'],
            stdout=subprocess.PIPE)

        grep = subprocess.Popen(
            ['grep', '18', '-A', '2'],
            stdin=amixer.stdout,
            stdout=subprocess.PIPE)

        awk = subprocess.Popen(
            ['awk', 'NR==3 { print $2 }'],
            stdin=grep.stdout,
            stdout=subprocess.PIPE)

        cut = subprocess.Popen(
            ['cut', '-d', '=', '-f', '2'],
            stdin=awk.stdout,
            stdout=subprocess.PIPE)

        stdout, err = cut.communicate()

        return stdout.decode(encoding='UTF-8')

    def __vol_level(self):
        amixer = subprocess.Popen(
            ['amixer', 'get', 'Master'],
            stdout=subprocess.PIPE)

        tail = subprocess.Popen(
            ['tail', '-n', '1'],
            stdin=amixer.stdout,
            stdout=subprocess.PIPE)

        cut = subprocess.Popen(
            ['cut', '-d', '[', '-f', '2'],
            stdin=tail.stdout,
            stdout=subprocess.PIPE)

        sed = subprocess.Popen(
            ['sed', 's/\%].*//g'],
            stdin=cut.stdout,
            stdout=subprocess.PIPE)

        stdout, err = sed.communicate()

        return stdout.decode(encoding='UTF-8')


# Widgets
dateWidget = DateWidget()
batWidget = BatWidget()
volWidget = VolWidget()
conStatus = ConStatus([volWidget, batWidget, dateWidget])
conStatus.write_header_to_stdout()

# Main loop
while True:
    conStatus.update()
    conStatus.write_status_to_stdout()
    time.sleep(1)
