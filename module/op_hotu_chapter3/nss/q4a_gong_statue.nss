//::///////////////////////////////////////////////
//:: Name q4a_gong_statue
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This script is for when the PC has replaced
     both ears on the gargoyle statue.  It will
     ring the gongs in the order the PCs need to
     solve the puzzle.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Jan 15, 2003
//:://////////////////////////////////////////////

void main()
{
   object oPC = GetPCSpeaker();
   int iNth;
   float fDelay;
   // The 3 gong sounds.
   object oGong;

   fDelay = 0.0;
   for(iNth = 1; iNth < 4; iNth++) {
      oGong = GetObjectByTag("gongsound_" + IntToString(iNth));
      DelayCommand(fDelay, SoundObjectPlay(oGong));
      DelayCommand(fDelay + 5.0, SoundObjectStop(oGong));
      fDelay = fDelay + 2.0;
   }
   SetLocalInt(GetArea(oPC), "gong_statue_done", 1);
   // Start the music again.
   DelayCommand(20.0, MusicBackgroundPlay(GetArea(OBJECT_SELF)));
}
