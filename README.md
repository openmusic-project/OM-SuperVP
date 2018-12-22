# om-supervp

<img src="resources/pict/supervp.png" align=right>

This library allows to use sound analysis and processing kernel SuperVP in OM visual programs.

_This library does NOT include SuperVP sources or binaries, which must be installed separately and located in the SuperVP section of OM Preferences/Libraries tab._

OM-SuperVP library for OM by Jean Bresson and Jean Lochard, (c) IRCAM 2006-2018

SuperVP is developed and distributed by IRCAM - Analysis/Synthesis team

*************
This program is free software. It is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY, without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 
*************

## Description

The OM-SuperVP tools are organized in three main categories : **analysis**, **processing**, and **synthesis**.

OM-SuperVP provides :

- a user-friendly interface to the sound processing kernel in your favorite computer-aided composition environment ;
- formatting sound processing or analysis parameters for SuperVP using OM symbolic/musical objects and visual programming tools ;
- designing complex processes including itérative/sequencial calls to the sound processing kernel ;
- connecting SuperVP processes to compositional processes and models developed in OM ;
- ...

## Configuration

Once the OM-SuperVP library is loaded in OM, a new item will appear in the Externals tab of the OM Preferences window. OM will display the kernel path in red if it is not found or not set correctly.

Depending on your distribution SuperVP might or might not be present in your library package. 
If needed you can specify the path to another location where it might be installed (e.g. within the _AudioSculpt_ application package: the sound processing kernels can be found inthe _AudioSculpt x.x.x/Kernels/_ folder).


## File Formats

### Parameters files

Most SuperVP processes use input files to read the parameters for sound treatments.

The parameters files are generally formatted as text, and can be written and read using standard text editors (or TextFile/TextBuffer objects in OM). They also require knowledge about formatting in order to work correctly, depending on the different sound treatments and processing. OM-SuperVP deals with these formatting issues for you, and converts standard OM objects (lists, BPFs, etc.) into adapted parameter files for SuperVP.

The default location for reading/writing the SuperVP parameters files can be set in the Preferences.
