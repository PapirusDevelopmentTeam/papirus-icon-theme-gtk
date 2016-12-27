# For Developers and Designers

Designing icons for Papirus is easy :)

You only need to draw icons for Papirus (Light theme) and then use our script to convert colors for ePapirus and Papirus Dark.

## Basic concepts

Papirus is a SVG-based icon theme for Linux, drawing inspiration from Material Design and flat design.

All elements are clear, distinct and have outlines. Another main feature that distinguishes our theme is its use of warm color tones.

Keeping this in mind, **please do not use** very bright and toxic colors for Papirus.

Examples are available in the main icon theme folders. In the `work` directory, you'll only find templates and scripts.

#### Main icons

Main icons have the following sizes: 16px, 22px, 24px, 32px and 48px. Also available are some 64px icons for Apps, Devices, Places and Mimes.

> Why do we need so many sizes for a SVG?

Because if we use a single size for all then the icons will be blurred. All objects on Papirus have pixelated alignment.

#### Monochrome icons

Papirus now also supports KDE color scheme for monochrome actions, devices, places and panel icons. You can find more detailed info about that [here](https://techbase.kde.org/Development/Tutorials/Plasma5/ThemeDetails#Colors).

Presently we only support the following icons:

- actions (16px, 22px, 24px)
- devices (16px)
- places (16px)
- panel (22px, 24px)

## System Requirements

- inkscape
- npm
- svgo

For Debian/Ubuntu/Linux Mint users:

```
sudo apt update
sudo apt install inkscape npm nodejs-legacy
sudo npm install -g npm svgo
```

## Step-by-Step Guide

### 1. Getting Started

Open directory `work` in a file manager and open a terminal at the directory. You can do it from the context menu entry `Open in Terminal` or `Action → Open Terminal Here`.

- #### Create a new icon

    Create a new icon from the provided template using the script `tools/work/new-icons.sh`. For all new icons, **please stick to using the template.** This is because the template already has some needed objects, like a CSS stylesheet.

    ```
    # For example

    ./new-icons.sh apps abricotine

    # It creates the required files inside work directory
    # ./Papirus/apps/abricotine@16x16.svg
    # ./Papirus/apps/abricotine@22x22.svg
    # ./Papirus/apps/abricotine@24x24.svg
    # ./Papirus/apps/abricotine@32x32.svg
    # ./Papirus/apps/abricotine@48x48.svg
    # ./Papirus/apps/abricotine@64x64.svg
    ```

- #### Edit an existing icon

    If you want modify an existing icon, you can do that using the script `tools/work/copy-from-theme.sh`.

    ```
    # For example

    ./copy-from-theme.sh panel transmission-tray-icon.svg

    # It copies files into work directory
    # ./Papirus/panel/transmission-tray-icon@22x22.svg
    # ./Papirus/panel/transmission-tray-icon@24x24.svg
    # ./Papirus-Dark/panel/transmission-tray-icon@22x22.svg
    # ./Papirus-Dark/panel/transmission-tray-icon@24x24.svg
    ```

**IMPORTANT:** Please don't remove suffixes from the filename as it's needed for other scripts. Filename extension must be in lowercase.

### 2. Papirus

1. Open the created/copied file on Inkscape.
2. Delete any objects you do not need.
3. Draw new objects.
4. Save file with same filename.
5. Repeat it for other sizes.

### 3. Papirus Dark


1. Run script `tools/work/convert-to-dark.sh`, it copies needed icons from `work/Papirus` to `work/Papirus-Dark` and changes its colors.

    **IMPORTANT:** Only draw icons for Papirus.

    ```
    ./convert-to-dark.sh
    ```

2. Check result and edit manually if needed.

### 4. ePapirus


1. Run script `tools/work/convert-to-e.sh`. It copies needed icons from `work/Papirus` to `work/ePapirus` and changes its colors.

    **IMPORTANT:** Only draw icons for Papirus.

    ```
    ./convert-to-e.sh
    ```

2. Check result and edit manually if needed.

### 5. Final Steps

1. Run script `tools/ffsvg.sh` for cleaning and fixing the icons:

    ```
    ../ffsvg.sh ePapirus/ Papirus/ Papirus-Dark/
    ```

2. Please check your icons again.
3. If everything is fine then copy icons into main icon theme folders:

    ```
    ./copy-to-theme.sh
    ```

4. Clean the `work` directory:

    ```
    ./clean.sh
    ```

5. Everything is ready now! You can commit the changes to GitHub.
