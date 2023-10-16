//::///////////////////////////////////////////////
//:: Name mod_unaquire_itm
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Make the portal stone 'undropable'.  If the
    portal stone is dropped by a player - put it
    back in his inventory.
    Dropping a powderkeg creates the powderkeg placeable
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Dec 3/02
//:://////////////////////////////////////////////

void main()
{
    object oItem = GetModuleItemLost();
    //The portal stone
    if (GetTag(oItem) == "x2_p_reaper")
    {
        object oPC = GetModuleItemLostBy();
        DestroyObject(oItem);
        CreateItemOnObject("x2_p_portal", oPC);
        SendMessageToPCByStrRef(oPC, 84145 );
    }
    //a powderkeg
    else if (GetTag(oItem) == "x2_it_pkeg")
    {
        location lLoc = GetLocation(oItem);
        DestroyObject(oItem);
        CreateObject(OBJECT_TYPE_PLACEABLE,"x2_plc_pkeg",lLoc);
    }

}
