//::///////////////////////////////////////////////
//:: Name q4a_fountain
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This script will fill the bucket with magic
     water that can be used to revive the quest ox.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Jan 3, 2003
//:://////////////////////////////////////////////
void MakeBucket(object oPC);
void GivePartyXP(object oPC, int iXP);
void main()
{
   // Change this to give the party the desired XP amount.
   int iXP = 1000;
   object oUser = GetLastUsedBy();
   object oItem = GetItemPossessedBy(oUser, "q4a_bucket");
   object oItem2 = GetItemPossessedBy(oUser, "q4a_bucket_m");
   // The int set to show that the velox plant has been used on the
   // fountain.
   int iMagic = GetLocalInt(OBJECT_SELF, "magic");

   // If they already have the bucket filled with magic water, just send
   // them feedback.
   if(oItem2 != OBJECT_INVALID)
   {
      //SendMessageToPC(oUser, "[NOT IN STRING EDITOR] You have already filled the bucket with the Magic Water.");
   // Fill the bucket.
   }
   else if(oItem != OBJECT_INVALID && iMagic != 1)
   {
      //SendMessageToPC(oUser, "Normal water will do you no good.");
   }
   else if(oItem != OBJECT_INVALID && iMagic == 1) {
      AssignCommand(oUser, PlaySound("al_na_stream1"));
      DelayCommand(0.1, AssignCommand(oUser, PlayAnimation(ANIMATION_LOOPING_GET_MID, 1.0, 3.5)));
      DestroyObject(oItem, 2.9);
      //DelayCommand(2.8, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_HEALING_X), OBJECT_SELF));
      DelayCommand(3.0, MakeBucket(oUser));
      //DelayCommand(3.1, SendMessageToPC(oUser, "[NOT IN STRING EDITOR] You have filled the bucket with the Magic Water."));
      DelayCommand(3.2, AddJournalQuestEntry("q4a_bessy_j", 25, oUser, TRUE, TRUE));
      //DelayCommand(3.2, GivePartyXP(oUser, iXP));
   }
   else
   {
      //SendMessageToPC(oUser, "[NOT IN STRING EDITOR] You have nothing to collect the water with.");
   }
}

// Creates a bucket filled with magic water. Done in a function
// so that it can be delayed.
void MakeBucket(object oPC) {
   CreateItemOnObject("q4a_bucket_m", oPC, 1);
}

// Give the party XP.
void GivePartyXP(object oPC, int iXP) {
   object oFaction = GetFirstFactionMember(oPC, TRUE);

   while(oFaction != OBJECT_INVALID) {
      GiveXPToCreature(oFaction, iXP);
      oFaction = GetNextFactionMember(oPC);
   }
}
