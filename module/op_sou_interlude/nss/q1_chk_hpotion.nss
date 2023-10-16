//::///////////////////////////////////////////////
//:: Name q1_chk_hpotion
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check to see if PC has cure light or cure moderate
    healing potion.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 12/03
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPotion = GetItemPossessedBy(GetPCSpeaker(), "NW_IT_MPOTION001");
    if(oPotion == OBJECT_INVALID)
        oPotion = GetItemPossessedBy(GetPCSpeaker(), "NW_IT_MPOTION020");
    if(oPotion == OBJECT_INVALID)
        oPotion = GetItemPossessedBy(GetPCSpeaker(), "NW_IT_MPOTION002");
    if(oPotion == OBJECT_INVALID)
        oPotion = GetItemPossessedBy(GetPCSpeaker(), "NW_IT_MPOTION003");
    if(oPotion == OBJECT_INVALID)
        oPotion = GetItemPossessedBy(GetPCSpeaker(), "NW_IT_MPOTION012");
    SetLocalObject(OBJECT_SELF, "POTION", oPotion);
    return oPotion != OBJECT_INVALID;
}
