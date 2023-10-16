//::///////////////////////////////////////////////
//:: Name q4c_sundial
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This script operates a backwards sundial in
     the Shattered Mirror Kingdom. Since this place
     is screwed up, the sundial will only tell time
     at night.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Dec 13, 2002
//:://////////////////////////////////////////////

void main()
{
     int iHour = GetTimeHour();
     // Put the time in a known format.
     int iHourConvert;
     if(iHour > 12)
          iHourConvert = iHour - 12;
     else
          iHourConvert = iHour;

     string sHour = IntToString(iHourConvert);

     if(GetIsNight())
     {
          //SpeakString("[NOT IN STRING EDITOR] It is roughly " + sHour + ":00");
     }
     else
     {
          //SpeakString("[NOT IN STRING EDITOR] Sundials do not work in the daytime.");
     }
}
