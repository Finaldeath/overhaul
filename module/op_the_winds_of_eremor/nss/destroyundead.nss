//::///////////////////////////////////////////////
//:: Destroy Undead Trigger OnEnter Script
//:: DestroyUndead.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Destroys any undead who enter the trigger.
    This prevents them from clustering around the
    doorways.
*/
//:://////////////////////////////////////////////

void main()
{
    object oEnterer = GetEnteringObject();
    string sTag = GetTag(oEnterer);

    if (sTag == "CRE_IridorUndead")
    {
        DestroyObject(oEnterer);
    }
}
