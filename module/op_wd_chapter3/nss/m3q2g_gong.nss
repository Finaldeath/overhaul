//::///////////////////////////////////////////////
//:: PlaySound
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This script handles the playing of the sounds
     for the gongs.
     Use the gong placeable, but add a 1, 2 ,3 or 4
     to its tagname.

     SOUND OBJECTS USED:
      M3SOUNDFAIL : sound that plays when the entire puzzle fails
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

#include "M3PLOTINCLUDE"

// * returns the current combo the player has tried so far
string GetCurrentCombo()
{
    return  GetLocalString(GetArea(OBJECT_SELF), "NW_GAREA_GONGPUZZLENOTESPLAYED") ;
}
// * returns the current combo the player has tried so far
string GetDesiredCombo()
{
    return  GetLocalString(GetArea(OBJECT_SELF), "NW_GAREA_GONGPUZZLEDESIRED");
}

void AddNote(string sNote)
{
    string sTemp = GetLocalString(GetArea(OBJECT_SELF), "NW_GAREA_GONGPUZZLENOTESPLAYED");
    sTemp = sTemp + sNote;
    SetLocalString(GetArea(OBJECT_SELF), "NW_GAREA_GONGPUZZLENOTESPLAYED", sTemp);
    ActionSpeakStringByStrRef(57985); // Says 'Note Played'
}
void VisualNote(string sNote)
{
//    SpeakString(sNote);
}

void AudioNote(string sNote)
{
    object oSound =  GetNearestObjectByTag("M3Q1F20GongSound" + sNote);
    if (GetIsObjectValid(oSound) == TRUE)
    {
        SoundObjectPlay(oSound);
    }
    else
    {
        ActionSpeakStringByStrRef(0);
    }

}
void main()
{


    // * M3Q1F20Gong1 is the base tag
    // * each gone has a number at the end of its
    // * tag saying which gong it is
        string sNote = GetSubString(GetTag(OBJECT_SELF),11, 1);
        VisualNote(sNote);
        AudioNote(sNote);

    // * if it is the fairy doing this, then quit now
    if (GetIsPC(GetLastUsedBy()) == FALSE)
      return;

        AddNote(sNote);

    int nCount = GetStringLength(GetCurrentCombo());

    // * if notes at 8 or more, try to see if this is the match
    // * if not, reset back to 0.
    if (nCount >= 8)
    {
    //    SpeakString("DESIRED: " + GetDesiredCombo());
      if (GetCurrentCombo() == GetDesiredCombo())
      {
//        SpeakString("TEMP: Sound Lock unlocked.  Congratuatlions.  Please ask Brent to finish implementing");
        object oFairy = GetNearestObjectByTag("M3Q2G_FAIRY");

        AssignCommand(oFairy,ActionSpeakStringByStrRef(66207));
        SetLocalObject(oFairy,"NW_G_M3Q2G_GONG",GetLastUsedBy());
      }
      else
      {
        SoundObjectPlay(GetNearestObjectByTag("M3SOUNDFAIL"));
        ActionSpeakStringByStrRef(57986);  // * Says failed, start over
        //SpeakString("Play Fail Sound here");
      }
      SetLocalString(GetArea(OBJECT_SELF), "NW_GAREA_GONGPUZZLENOTESPLAYED", "");
    }

}
