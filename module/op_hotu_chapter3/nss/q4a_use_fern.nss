//::///////////////////////////////////////////////
//:: Name q4a_use_fern
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This script will allow players to gather
     leaves from this plant that can be used
     for healing. The plant will produce
     between 1-3 leaves and then will destroy
     itself. Rangers and Druids will get 2 or
     3 leaves, others will get only 1 leaf.

     // This has been changed to be berries that
     // the player will need to light fires in the
     // Wastelands.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Jan 2, 2003
//:://////////////////////////////////////////////

void main()
{
   object oUser = GetLastUsedBy();

   // Only successful if the user is a druid or a ranger.
   /*if(GetClassByPosition(1, oUser) == CLASS_TYPE_DRUID ||
      GetClassByPosition(2, oUser) == CLASS_TYPE_DRUID ||
      GetClassByPosition(3, oUser) == CLASS_TYPE_DRUID ||
      GetClassByPosition(1, oUser) == CLASS_TYPE_RANGER ||
      GetClassByPosition(2, oUser) == CLASS_TYPE_RANGER ||
      GetClassByPosition(3, oUser) == CLASS_TYPE_RANGER) {
   */

       if (GetLocalInt(OBJECT_SELF, "nDoOnce") != 1)
       {
            SetLocalInt(OBJECT_SELF, "nDoOnce", 1);
            // Play an animation
            AssignCommand(oUser, PlayAnimation(ANIMATION_LOOPING_GET_LOW, 1.0, 2.0));
            DelayCommand(0.5, PlaySound("as_na_leafmove2"));
            // Determine how many leaves are foraged. Rangers and Druids will
            // always get 2 or 3 leaves.
            int iAmt = (Random(10) + 1);
            if(iAmt == 10) {
                CreateItemOnObject("hx_fire_berries", oUser, 3);
                //SendMessageToPC(oUser, "[NOT IN STRING EDITOR] You manage to forage 3 Velox Berries from the plant.");
                SendMessageToPCByStrRef(oUser, 85524);
                DestroyObject(OBJECT_SELF, 2.0);
            }
            else if(iAmt < 10 && iAmt >= 7) {
                CreateItemOnObject("hx_fire_berries", oUser, 2);
                //SendMessageToPC(oUser, "[NOT IN STRING EDITOR] You manage to forage 2 Velox Berries from the plant.");
                SendMessageToPCByStrRef(oUser, 85525);
                DestroyObject(OBJECT_SELF, 2.0);
            }
           //}
           // Not a Druid or Ranger. Give them 1 leaf.
            else {
                //AssignCommand(oUser, PlayAnimation(ANIMATION_LOOPING_GET_LOW, 1.0, 2.0));
                //SendMessageToPC(oUser, "[NOT IN STRING EDITOR] You manage to forage 1 Velox Berry from the plant.");
                SendMessageToPCByStrRef(oUser, 85526);
                CreateItemOnObject("hx_fire_berries", oUser, 1);
                DestroyObject(OBJECT_SELF, 2.0);
            }
       }
}
