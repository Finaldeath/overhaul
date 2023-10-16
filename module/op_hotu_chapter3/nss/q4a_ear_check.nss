//::///////////////////////////////////////////////
//:: Name q4a_ear_check
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script will check how many gargoyle ears
    are present on the PC.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Jan 15, 2003
//:://////////////////////////////////////////////
void CheckForEars(object oPC);
void main()
{
   object oPC = GetPCSpeaker();

   CheckForEars(oPC);
}

// Function for counting how many Gargoyle Ears a PC has.
void CheckForEars(object oPC){
   object oEar = GetFirstItemInInventory(oPC);

   SetLocalInt(oPC, "ears", 0);
   while(oEar != OBJECT_INVALID) {
      if(GetTag(oEar) == "gargoyle_ear")
         SetLocalInt(oPC, "ears", GetLocalInt(oPC, "ears") + 1);
      oEar = GetNextItemInInventory(oPC);
   }
}
