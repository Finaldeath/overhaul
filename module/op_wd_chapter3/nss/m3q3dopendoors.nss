//::///////////////////////////////////////////////
//:: M3Q3DOPENDOORS.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   Opens all the doors in the area
   NW_L_NUMBERPOTIONS : This is the local that controls
                        the number of potions the demon has consumed.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
        ActionPauseConversation();
   object oPotion = GetItemPossessedBy(GetPCSpeaker(), "M3Q3D_SUCCUBUS");
   if (GetIsObjectValid(oPotion) == TRUE)
   {
        DestroyObject(oPotion);
//        SpeakString("1.");
    //    AssignCommand(GetPCSpeaker(),ActionGiveItem(oPotion,OBJECT_SELF));
   }


   int nOldValue = GetLocalInt(OBJECT_SELF,"NW_L_NUMBERPOTIONS");
   nOldValue = nOldValue + 1;
   SetLocalInt(OBJECT_SELF,"NW_L_NUMBERPOTIONS", nOldValue);
   object oDoor = GetFirstObjectInArea(GetArea(OBJECT_SELF));
    object oWay = GetObjectByTag("WP_M3Q3D_SPELL");
    location lWay = GetLocation(oWay);
    ActionCastFakeSpellAtLocation(SPELL_KNOCK,lWay);
   while (GetIsObjectValid(oDoor) == TRUE)
   {
    if (GetObjectType(oDoor) == OBJECT_TYPE_DOOR)
    {
       AssignCommand(oDoor, ActionOpenDoor(oDoor));
       SetLocked(oDoor,FALSE);
    }
    oDoor = GetNextObjectInArea(GetArea(OBJECT_SELF));
   }
/*   PlayAnimation(ANIMATION_FIREFORGET_TAUNT);
   effect eVis = EffectVisualEffect(VFX_DUR_PROTECTION_GOOD_MINOR);
   ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVis, OBJECT_SELF, 4.0);*/
    SetLocalInt(GetPCSpeaker(),"NW_G_M3Q3D_SUCCDOORS",1);
        ActionResumeConversation();

}
