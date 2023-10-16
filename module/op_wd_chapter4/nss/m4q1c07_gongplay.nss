//::///////////////////////////////////////////////
//:: PlaySound
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This script handles the playing of the sounds
     for the gongs.
     Use the gong placeable, but add a 1, 2 ,3 or 4
     to its tagname.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

//#include "M3PLOTINCLUDE"

// * returns the current combo the player has tried so far
string GetCurrentCombo()
{
    return  GetLocalString(GetArea(OBJECT_SELF), "NW_GAREA_GONGPUZZLENOTESPLAYED") ;
}
// * returns the current combo the player has tried so far
string GetDesiredCombo(int nSeries)
{
    return  GetLocalString(GetArea(OBJECT_SELF), "NW_GAREA_GONGPUZZLE_" + IntToString(nSeries));
}

void AddNote(string sNote)
{
    string sTemp = GetLocalString(GetArea(OBJECT_SELF), "NW_GAREA_GONGPUZZLENOTESPLAYED");
    sTemp = sTemp + sNote;
    SetLocalString(GetArea(OBJECT_SELF), "NW_GAREA_GONGPUZZLENOTESPLAYED", sTemp);
}
void VisualNote(string sNote)
{
    ActionSpeakStringByStrRef(57985);
//    SpeakString(sNote);
}

void AudioNote(string sNote)
{
    object oSound =  GetNearestObjectByTag("M4Q1C2_GONG" + sNote);
    if (GetIsObjectValid(oSound) == TRUE)
    {
        SoundObjectPlay(oSound);
    }
    else
    {
        ActionSpeakStringByStrRef(57985);
    }

}
void main()
{


    // * M3Q1F20Gong1 is the base tag
    // * each gone has a number at the end of its
    // * tag saying which gong it is
        string sNote = GetSubString(GetTag(OBJECT_SELF),13, 1);
        VisualNote(sNote);
        AudioNote(sNote);

    // * if it is the fairy doing this, then quit now
    if (GetIsPC(GetLastUsedBy()) == FALSE)
      return;

        AddNote(sNote);

    int nCount = GetStringLength(GetCurrentCombo());

    // * if notes at 3 or more, try to see if this is the match
    // * if not, reset back to 0.
    if (nCount >= 3)
    {
    //    SpeakString("DESIRED: " + GetDesiredCombo());
          int nCurrentSeries = 1;
          if (GetLocalInt(GetModule(),"NW_G_M41C07_LEVER_PUZZLE") == 10)
          {
            nCurrentSeries = 1;
          }
          else if (GetLocalInt(GetModule(),"NW_G_M41C07_LEVER_PUZZLE") == 20)
          {
            nCurrentSeries = 2;
          }
          else if (GetLocalInt(GetModule(),"NW_G_M41C07_LEVER_PUZZLE") == 30)
          {
            nCurrentSeries = 3;
          }
          else if (GetLocalInt(GetModule(),"NW_G_M41C07_LEVER_PUZZLE") == 40)
          {
            nCurrentSeries = 4;
          }

          //use this global to figure out which puzzle

          if (GetCurrentCombo() == GetDesiredCombo(nCurrentSeries))
          {
           //  * Proceed to next note combination
           //SpeakString("Combo 1 good");
               if (GetLocalInt(GetModule(),"NW_G_M41C07_LEVER_PUZZLE") == 40)
               {
//                SpeakString("TEMP : ALL OVER");
                // * create key, destroy machine and open door
                CreateItemOnObject("M4Q1C07Key", GetLastUsedBy());
                object oDoor = GetNearestObjectByTag("M4Q1C07_DOOR");
                SetLocked(oDoor, FALSE);
                AssignCommand(oDoor, ActionOpenDoor(OBJECT_SELF));
                effect eVis = EffectVisualEffect(VFX_FNF_FIREBALL);
                location lMachine=GetLocation(GetNearestObjectByTag("M4Q1C07_MACH"));
                DelayCommand(1.0,ApplyEffectAtLocation(DURATION_TYPE_INSTANT,eVis,lMachine));
                DelayCommand(2.0,DestroyObject(GetNearestObjectByTag("M4Q1C07_MACH")));

               }
               else
               {
               SetLocalInt(GetModule(),"NW_G_M41C07_LEVER_PUZZLE",GetLocalInt(GetModule(),"NW_G_M41C07_LEVER_PUZZLE") + 10);
               AssignCommand(GetNearestObjectByTag("M4Q1C07_MACH"), SpeakOneLinerConversation());
               }
          }
          else
          {
            ActionSpeakStringByStrRef(57986);
            SetLocalInt(GetModule(),"NW_G_M41C07_LEVER_PUZZLE",10);
           AssignCommand(GetNearestObjectByTag("M4Q1C07_MACH"), SpeakOneLinerConversation());
          }
          SetLocalString(GetArea(OBJECT_SELF), "NW_GAREA_GONGPUZZLENOTESPLAYED", "");
    }

}
