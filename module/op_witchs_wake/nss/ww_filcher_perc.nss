//::///////////////////////////////////////////////
//:: Witchwork: Ethereal Filcher OnPerceive
//:: WW_Filcher_Perc.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     The Filcher gets distracted by any items it
     sees lying around and will pick them up.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 5, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPerceived = GetLastPerceived();
    int iObjectType = GetObjectType(oPerceived);

    //If the perceived object is an item...
    if (iObjectType == OBJECT_TYPE_ITEM)
    {
        //Move to the object and pick it up...
        ClearAllActions();
        ActionMoveToObject(oPerceived);
        ActionPickUpItem(oPerceived);
    }
}
