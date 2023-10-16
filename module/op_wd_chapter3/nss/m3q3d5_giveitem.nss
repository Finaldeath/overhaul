//::///////////////////////////////////////////////
//:: M3Q3D5_GIVEITEM.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Demon gives the player a magical item.
*/
//:://////////////////////////////////////////////
//:: Created By:     Brent
//:: Created On:     January 2002
//:://////////////////////////////////////////////

void main()
{
   object oPotion = GetItemPossessedBy(GetPCSpeaker(), "M3Q3D_SUCCUBUS");
   if (GetIsObjectValid(oPotion) == TRUE)
   {
        ActionPauseConversation();
        DestroyObject(oPotion);
//        SpeakString("2.");
//        AssignCommand(GetPCSpeaker(),ActionGiveItem(oPotion,OBJECT_SELF));
        ActionResumeConversation();
   }

   SetLocalInt(OBJECT_SELF,"NW_L_NUMBERPOTIONS", GetLocalInt(OBJECT_SELF,"NW_L_NUMBERPOTIONS") + 1);
    SetLocalInt(OBJECT_SELF,"NW_L_GAVEITEMALREADY",1);
    CreateItemOnObject("NW_WSWMDG003", GetPCSpeaker());
}
