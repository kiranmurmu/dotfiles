from kitty.constants import appname, str_version
from kitty.fast_data_types import Screen, get_options, get_boss
from kitty.tab_bar import DrawData, ExtraData, TabBarData, as_rgb, draw_title
from kitty.utils import color_as_int

boss = get_boss()
opts = get_options()


def calc_draw_spaces(*args) -> int:
    length = 0
    for i in args:
        if not isinstance(i, str):
            i = str(i)
        length += len(i)
    return length


def _draw_icon(screen: Screen, index: int, symbol: str = None) -> int:
    if index != 1:
        return

    active_window = boss.active_tab.active_window
    window_id = boss.active_tab.windows.all_windows.index(active_window)
    active_fg = opts.active_tab_foreground
    active_bg = opts.active_tab_background

    symbol = symbol or f"[{window_id + 1}]"
    fg, bg = screen.cursor.fg, screen.cursor.bg

    screen.cursor.fg = as_rgb(color_as_int(active_fg))
    screen.cursor.bg = as_rgb(color_as_int(active_bg))
    screen.draw(symbol)
    screen.cursor.fg, screen.cursor.bg = fg, bg
    screen.cursor.x = len(symbol)

    return screen.cursor.x


def _draw_left_status(
    draw_data: DrawData,
    screen: Screen,
    tab: TabBarData,
    before: int,
    max_title_length: int,
    index: int,
    is_last: bool,
    extra_data: ExtraData,
) -> int:
    if draw_data.leading_spaces:
        screen.draw(" " * draw_data.leading_spaces)
    draw_title(draw_data, screen, tab, index)
    trailing_spaces = min(max_title_length - 1, draw_data.trailing_spaces)
    max_title_length -= trailing_spaces

    if trailing_spaces:
        screen.draw(" " * trailing_spaces)
    end = screen.cursor.x
    screen.cursor.bold = screen.cursor.italic = False
    screen.cursor.fg = 0

    if not is_last:
        screen.cursor.bg = as_rgb(color_as_int(draw_data.inactive_bg))
        screen.draw(draw_data.sep)
    screen.cursor.bg = 0

    return end


def _draw_right_status(screen: Screen, is_last: bool) -> int:
    if not is_last:
        return

    title = boss.active_tab.title
    title = f" {' ' * 3}{title.strip()}"
    about = f" [{appname} v{str_version}]"

    inactive_fg = opts.inactive_tab_foreground
    inactive_bg = opts.inactive_tab_background
    active_fg = opts.active_tab_foreground
    active_bg = opts.active_tab_background

    right_status_length = calc_draw_spaces(title, about)
    draw_spaces = screen.columns - screen.cursor.x - right_status_length

    if draw_spaces > 0:
        screen.draw(" " * draw_spaces)
    elif screen.cursor.x >= screen.columns:
        about = ""
    elif draw_spaces < 0:
        title = title[:(draw_spaces - 3)] + "..."

    cells = [
        ((inactive_fg, inactive_bg), title),
        ((active_fg, active_bg), about),
    ]

    for color, status in cells:
        screen.cursor.fg = as_rgb(color_as_int(color[0]))
        screen.cursor.bg = as_rgb(color_as_int(color[1]))
        screen.draw(status)
    screen.cursor.fg = 0
    screen.cursor.bg = 0

    if screen.columns - screen.cursor.x > right_status_length:
        screen.cursor.x = screen.columns - right_status_length

    return screen.cursor.x


def draw_tab(
    draw_data: DrawData,
    screen: Screen,
    tab: TabBarData,
    before: int,
    max_title_length: int,
    index: int,
    is_last: bool,
    extra_data: ExtraData,
) -> int:
    _draw_icon(screen, index)

    end = _draw_left_status(
        draw_data,
        screen,
        tab,
        before,
        max_title_length,
        index,
        is_last,
        extra_data,
    )

    _draw_right_status(
        screen,
        is_last,
    )

    return end
