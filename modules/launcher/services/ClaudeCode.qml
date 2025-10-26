pragma Singleton

import ".."
import qs.config
import qs.utils
import Quickshell
import QtQuick

Searcher {
    id: root

    function transformSearch(search: string): string {
        return search.slice(`${Config.launcher.actionPrefix}claudecode `.length);
    }

    function selector(item: var): string {
        return item.prompt;
    }

    list: [promptItem]
    useFuzzy: false
    key: "prompt"

    readonly property QtObject promptItem: QtObject {
        readonly property string prompt: transformSearch(currentPrompt)

        function onClicked(list: AppList): void {
            if (prompt.trim() === "") {
                // If no prompt provided, just open Claude Code in home directory
                list.visibilities.launcher = false;
                Quickshell.execDetached(["foot", "-D", "/home/cardinal", "claude", "--dangerously-skip-permissions"]);
            } else {
                // Launch with the provided prompt
                list.visibilities.launcher = false;
                Quickshell.execDetached(["foot", "-D", "/home/cardinal", "claude", "--dangerously-skip-permissions", prompt]);
            }
        }
    }

    property string currentPrompt: ""

    function query(search: string): list<var> {
        currentPrompt = search;
        return [promptItem];
    }
}
