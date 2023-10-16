//::///////////////////////////////////////////////
//:: Take Golem Replication Rod
//:: 2q6e_takereplic
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Removes the replication rod and sets the local to
    current +1.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: April 7, 2002
//:://////////////////////////////////////////////

void main()
{
    object oControl = GetItemPossessedBy(GetPCSpeaker(), "2Q6E_GolemRod");
    if(GetIsObjectValid(oControl))
    {
        DestroyObject(oControl, 0.0);
        SetLocalInt(OBJECT_SELF, "NW_2Q6E_REPLICATION_ROD", 1);
    }
}
