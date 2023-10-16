//::///////////////////////////////////////////////
//:: Name q1h_dist_crib
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check to see if the baby (q1hbaby) has been
    placed or taken from the crib..
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: April 1/03
//:://////////////////////////////////////////////

void main()
{
    object oBaby = GetInventoryDisturbItem();
    if (GetTag(oBaby) =="q1hbaby")
    {
        if (GetInventoryDisturbType() == INVENTORY_DISTURB_TYPE_ADDED)
        {
            SetLocalInt(GetModule(), "X1_Q1HBabyInCrib", 1);
        }
        else if (GetInventoryDisturbType() == INVENTORY_DISTURB_TYPE_REMOVED)
        {
            SetLocalInt(GetModule(), "X1_Q1HBabyInCrib", 0);
        }
    }

}
