//::///////////////////////////////////////////////
//::
//:: OnPerceived
//::
//:: M1Q4Mugger01_2.nss
//::
//:: Copyright (c) 2001 Bioware Corp.
//::
//::
//:://////////////////////////////////////////////
//::
//::
//:: This is where the mugger checks out any PC
//:: that enters his vision.
//::
//::
//:://////////////////////////////////////////////
//::
//:: Created By: John
//:: Created On: September 14, 2001
//::
//:://////////////////////////////////////////////

void main()
{
    object oTarget = GetLastPerceived();

    if (GetLastPerceptionSeen() == TRUE)
    {
        // Run away from enemies, Coward!
        if (GetIsEnemy(oTarget))
        {
            ClearAllActions();
            ActionMoveAwayFromObject(oTarget,TRUE);
        }
        // If no mark has been set, save this mark and check him out.
        else if (oTarget == GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC) &&
                GetLocalInt(OBJECT_SELF,"NW_L_FindMark") == 0)
        {
            SetLocalObject(OBJECT_SELF,"NW_L_PCMark",oTarget);
        }
    }
}
