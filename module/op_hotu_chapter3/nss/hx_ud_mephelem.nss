//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName hx_ud_mephelem
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will clean up the area.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Sept 9, 2003
//:://////////////////////////////////////////////
#include "hx_inc_meph"
void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        object oPC = GetFirstPC();
        int iGrapple = GetPCAtGrapple(oPC);
        int iThere = GetPCAtGrapple(OBJECT_SELF);

        // Teleport to PC if they are at grapple point and you are not.
        // Vice versa as well.
        if(((iGrapple == TRUE && iThere == FALSE) || (iGrapple == FALSE && iThere == TRUE)) ||
           (GetCurrentAction() != ACTION_ATTACKOBJECT && GetDistanceToObject(oPC) <= 11.0))
        {
            ClearAllActions(TRUE);

            if(GetTag(OBJECT_SELF) != "hx_iceelem")
            {
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIREBALL), GetLocation(OBJECT_SELF));
            }
            else
            {
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_UNDEAD), GetLocation(OBJECT_SELF));
            }
            ClearAllActions(TRUE);
            //DelayCommand(2.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_UNDEAD), GetLocation(OBJECT_SELF)));
            DelayCommand(0.3, ActionJumpToLocation(GetLocation(oPC)));
            DelayCommand(0.7, ActionAttack(oPC));
        }

    }
    else if(nUser == 1002) // PERCEIVE
    {

    }
    else if(nUser == 1003) // END OF COMBAT
    {
        object oPC = GetFirstPC();
        int iGrapple = GetPCAtGrapple(oPC);
        int iThere = GetPCAtGrapple(OBJECT_SELF);

        // Teleport to PC if they are at grapple point and you are not.
        // Vice versa as well.
        if(((iGrapple == TRUE && iThere == FALSE) || (iGrapple == FALSE && iThere == TRUE)))
        {
            ClearAllActions(TRUE);

            if(GetTag(OBJECT_SELF) != "hx_iceelem")
            {
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIREBALL), GetLocation(OBJECT_SELF));
            }
            else
            {
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_UNDEAD), GetLocation(OBJECT_SELF));
            }
            ClearAllActions(TRUE);
            //DelayCommand(2.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_UNDEAD), GetLocation(OBJECT_SELF)));
            DelayCommand(0.3, ActionJumpToLocation(GetLocation(oPC)));
            DelayCommand(0.7, ActionAttack(oPC));
        }
    }
    else if(nUser == 1004) // ON DIALOGUE
    {

    }
    else if(nUser == 1005) // ATTACKED
    {

    }
    else if(nUser == 1006) // DAMAGED
    {

    }
    else if(nUser == 1007) // DEATH
    {
        string sTag = GetTag(OBJECT_SELF);
        int x = 0;
        object oElem1 = GetObjectByTag(sTag, 0);
        object oElem2 = GetObjectByTag(sTag, 1);
        object oElem3 = GetObjectByTag(sTag, 2);
        object oArea = GetArea(OBJECT_SELF);
        object oSound;

        if((GetIsObjectValid(oElem1) && !GetIsDead(oElem1)))
        {
            x = x + 1;
        }
        if((GetIsObjectValid(oElem2) && !GetIsDead(oElem2)))
        {
            x = x + 1;
        }
        if((GetIsObjectValid(oElem3) && !GetIsDead(oElem3)))
        {
            x = x + 1;
        }

        // If none left, clear area.
        if(x <= 0)
        {
            SignalEvent(oArea, EventUserDefined(4444));
            if(GetLevelType(oArea) == 1)
            {
                oSound = GetObjectByTag("hx_lava_sound");

                AssignCommand(oArea, CleanLava(oSound));
                AssignCommand(oArea, DelayCommand(0.5, CleanLava(oSound, TRUE)));
            }
            else
            {
                oSound = GetObjectByTag("hx_ice_sound");

                AssignCommand(oArea, CleanLava(oSound, TRUE));
                AssignCommand(oArea, DelayCommand(0.5, CleanLava(oSound, TRUE)));
            }
        }
    }
    else if(nUser == 1008) // DISTURBED
    {

    }

}

