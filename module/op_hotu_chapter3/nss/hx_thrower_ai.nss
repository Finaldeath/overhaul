//::///////////////////////////////////////////////
//:: Name hx_thrower_ai
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will guide the demonic creatures that
     throw objects around the level.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Aug 19, 2003
//:://////////////////////////////////////////////
#include "hx_inc_thrower"
#include "hx_inc_ring"

// Find the distance to closest PC.
object GetClosestPC();

void main()
{
    object oThrow = GetThrowObject();
    object oEnemy = GetEnemy();
    object oPC = GetClosestPC();
    object oEnemyPC = GetLocalObject(OBJECT_SELF, "HX_HELL_ENEMY");

    if(GetIsObjectValid(oEnemyPC))
    {
        if(GetDistanceToObject(oEnemyPC) >= 10.0 && GetDistanceToObject(oEnemyPC) <= 40.0)
        {
            oEnemy = oEnemyPC;
        }
    }

    // Only active if a PC is present.
    if(GetAreaPC(GetArea(OBJECT_SELF)) != OBJECT_INVALID)
    {
        // Attack PC if close.
        if(GetDistanceToObject(oPC) <= 8.0 && !GetIsInCombat())
        {
            ClearAllActions(TRUE);
            ActionAttack(oPC);
        }
        // Only throw things if not in normal combat.
        else if(!GetIsInCombat())
        {
            if(GetIsObjectValid(oThrow))
            {
                if(GetIsObjectValid(oEnemy) && oEnemy != OBJECT_SELF)
                {
                    float fDist = GetDistanceToObject(oThrow);
                    // Near a throwable object.
                    if(fDist <= 6.0)
                    {
                        ClearAllActions(TRUE);
                        ActionThrowObject(oThrow, oEnemy);
                    }
                    // Move to a throwable object.
                    else
                    {
                        ActionMoveToObject(oThrow, TRUE, 5.5);
                    }
                }
            }
            else
            {
                if(GetIsObjectValid(oEnemy) && oEnemy != OBJECT_SELF)
                {
                    ClearAllActions();
                    ActionAttack(oEnemy);
                }
                else
                {
                    ClearAllActions();
                    ActionRandomWalk();
                }
            }
        }
    }
}

// Find the distance to closest PC.
object GetClosestPC()
{
    object oPC = GetFirstPC();
    float fDist = -1.0;
    object oShortPC;
    int x = 0;

    while(GetIsObjectValid(oPC))
    {
        fDist = GetDistanceToObject(oPC);
        if(x == 0)
        {
            x = 1;
            oShortPC = oPC;
        }
        else if((GetDistanceToObject(oPC) < GetDistanceToObject(oShortPC)) &&
                  GetDistanceToObject(oPC) != -1.0)
        {
            oShortPC = oPC;
        }
        oPC = GetNextPC();
    }
    return oShortPC;
}
