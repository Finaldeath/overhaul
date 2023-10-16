//::///////////////////////////////////////////////
//:: Name hx_pcuse_throw
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will handle when the PC uses a throwable
     object. If they are in a giant form, they
     will throw the object at the nearest enemy in
     range.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Aug 20, 2003
//:://////////////////////////////////////////////
#include "hx_inc_thrower"
#include "hx_inc_appear"
void main()
{
    object oPC = GetLastUsedBy();
    object oEnemy = GetEnemy();
    object oThrow = OBJECT_SELF;

    int iAppearance = GetAppearanceType(oPC);

    // Add here for other allowed types.
    if(CheckGiant(oPC))
    {
        // Only grab if an enemy is near.
        if(GetIsObjectValid(oEnemy) && oEnemy != OBJECT_SELF)
        {
            AssignCommand(oPC, ClearAllActions(TRUE));
            AssignCommand(oPC, ActionThrowObject(oThrow, oEnemy));
        }
        else if(oEnemy == OBJECT_SELF)
        {
            //SpeakString("[NOT IN STRING EDITOR] There are no enemies within throwing range.");
            SpeakStringByStrRef(85502);
        }
        else
        {
            //SpeakString("[NOT IN STRING EDITOR] You see no reason to pick this up");
            SpeakStringByStrRef(85504);
        }
    }
    else
    {
        //SpeakString("[NOT IN STRING EDITOR] You are not large enough to pick this up");
        SpeakStringByStrRef(85505);
    }
}
