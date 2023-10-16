//////////////////////////////////////////////////////////////////////////////////
// This is a script for the gargoyle statue sound puzzle.  It is missing its ears
// and until they are replaced, it won't give a clue to the puzzle.  Once they are
// replaced, the clue can then be accessed.  XP will be given as well, along with a
// journal update.
//
// Created by: Brad Prince
// 9-17-02
//
//////////////////////////////////////////////////////////////////////////////////


void CheckForEars(object oPC);
void DestroyEars(object oPC);
void main()
{
   object oPC = GetLastUsedBy();
   object oGong;
   int iNth;
   float fDelay;
   // Variable for counting the ears that a PC has obtained.
   int iEars;

   // Reset the variable.
   SetLocalInt(oPC, "ears", 0);
   // See how many they have.
   CheckForEars(oPC);
   iEars = GetLocalInt(oPC, "ears");

   if(iEars >= 2 || GetLocalInt(GetArea(oPC), "gargoyle_sound") == 1) {
      if(GetLocalInt(oPC, "gargoyle_sound") == 1) {
         fDelay = 0.0;
         for(iNth = 1; iNth < 4; iNth++) {
            oGong = GetObjectByTag("gongsound_" + IntToString(iNth));
            DelayCommand(fDelay, SoundObjectPlay(oGong));
            DelayCommand(fDelay + 5.0, SoundObjectStop(oGong));
            fDelay = fDelay + 2.0;
         }
      }
      else {
         fDelay = 4.5;
         for(iNth = 1; iNth < 4; iNth++) {
            oGong = GetObjectByTag("gongsound_" + IntToString(iNth));
            DelayCommand(fDelay, SoundObjectPlay(oGong));
            DelayCommand(fDelay + 5.0, SoundObjectStop(oGong));
            fDelay = fDelay + 2.0;
         }
         AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_GET_MID, 1.0, 2.0));
         //DelayCommand(3.0, AssignCommand(oPC, SpeakString("[NOT IN STRING EDITOR] These ears fit perfectly in the holes. That should do the trick.")));
         SetLocalInt(GetArea(oPC), "gargoyle_sound", 1);
         // Set the PC to be able to activate portal
         SetLocalInt(GetArea(oPC), "gong_statue_done", 1);
         DestroyEars(oPC);
         DelayCommand(3.2, GiveXPToCreature(oPC, 500));
         DelayCommand(3.3, AddJournalQuestEntry("gargoyle", 50, oPC, FALSE, FALSE));
      }
      //Restart the background music
      DelayCommand(20.0, MusicBackgroundPlay(GetArea(OBJECT_SELF)));
   }
   else if (iEars == 1)
   {
      //AssignCommand(oPC, SpeakString("[NOT IN STRING EDITOR] Looks like the ear I found will fit, but it looks like both ears need to be replaced at the same time."));
   }
   else
   {
      //AssignCommand(oPC, SpeakString("[NOT IN STRING EDITOR] Yes, the ears are definitely missing."));
   }
}

// Function for counting how many Gargoyle Ears a PC has.
void CheckForEars(object oPC){
   object oEar = GetFirstItemInInventory(oPC);

   while(oEar != OBJECT_INVALID) {
      if(GetTag(oEar) == "gargoyle_ear")
         SetLocalInt(oPC, "ears", GetLocalInt(oPC, "ears") + 1);
      oEar = GetNextItemInInventory(oPC);
   }
}

// Function for destroying the Gargoyle Ears on a PC once they have done the quest.
void DestroyEars(object oPC) {
   object oEar = GetFirstItemInInventory(oPC);

   while(oEar != OBJECT_INVALID) {
      if(GetTag(oEar) == "gargoyle_ear")
         DestroyObject(oEar);
      oEar = GetNextItemInInventory(oPC);
   }
}
