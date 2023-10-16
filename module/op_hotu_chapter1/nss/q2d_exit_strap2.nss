//::///////////////////////////////////////////////
//:: Name:  q2d_exit_strap2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When a PC leaves the trigger area for Special
    Trap#2 - if there are no other PCs within the
    trigger area - deactivate the trap.
*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On:Nov 20/02
//:://////////////////////////////////////////////


void main()
{
    object oPC = GetExitingObject();
    if (GetIsPC(oPC))
    {
        object oCreature = GetFirstInPersistentObject();
        int nCount = 0;
        while (oCreature != OBJECT_INVALID)
        {
            if (GetIsPC(oCreature))
            {
                nCount = nCount + 1;
            }
            oCreature = GetNextInPersistentObject();
        }
        if (nCount < 1)
        {
            SetLocalInt(GetModule(), "nSpecTrap2Active", 0);
        }
    }
}
