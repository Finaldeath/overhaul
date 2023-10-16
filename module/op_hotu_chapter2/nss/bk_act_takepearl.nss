//::///////////////////////////////////////////////
//:: bk_act_takepearl
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Takes the Pearl of Tongues
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
    object oPearl = GetItemPossessedBy(GetPCSpeaker(),"bk_pearl_tongue");
    if (GetIsObjectValid(oPearl) == TRUE)
    {
        DestroyObject(oPearl);
    }
}
