//::///////////////////////////////////////////////
//:: Name: q2c_play_divsnd
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On entrance of the divinity room - play the
    divinity sound.  Turn it off when a PC leaves
    the room
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////


void main()
{
    object oSound = GetObjectByTag("q2c_divinity_sound");
    SoundObjectPlay(oSound);
}
