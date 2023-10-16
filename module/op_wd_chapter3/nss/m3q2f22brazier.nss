//::///////////////////////////////////////////////
//:: M3Q2F22Brazier
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks for valid combinations of powders to
    produce the correct smoke.

    June 2002: added the delays because a programming bug
     could not be fixed.
*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: December 20 2001
//:://////////////////////////////////////////////
#include "M3PLOTINCLUDE"

float nTime = 7.0;

void main()
{
/*    if(GetLocalInt(GetLastDisturbed(),"NW_L_BRAZIERTIMES")==0)
    {
        ActionSpeakStringByStrRef(47309);
        SetLocalInt(GetLastDisturbed(),"NW_L_BRAZIERTIMES",1);
    }*/
    ClearAllActions();
    object oFirst = OBJECT_INVALID;
    object oSecond = OBJECT_INVALID;
    object oThird = OBJECT_INVALID;
    oFirst = GetFirstItemInInventory();
    oSecond = GetNextItemInInventory();
    oThird = GetNextItemInInventory();
    if(oThird == OBJECT_INVALID)
    {
        object oSmoke = OBJECT_INVALID;

        // * test orange
        object oItem1 = GetItemPossessedBy(OBJECT_SELF,"M3Q2F22POWDER2");
        object oItem2 = GetItemPossessedBy(OBJECT_SELF,"M3Q2F22POWDER3");
        if (GetIsObjectValid(oItem1) == TRUE && GetIsObjectValid(oItem2) == TRUE
            && GetLocalInt(OBJECT_SELF,"NW_L_ORDER") == 0)
        {
            oSmoke = CreateObject(OBJECT_TYPE_PLACEABLE, "M3Q2F18_ORANGE", GetLocation(OBJECT_SELF));
            AssignCommand(oSmoke, DelayCommand(nTime, DestroyObject(OBJECT_SELF)));
            SetLocalInt(OBJECT_SELF,"NW_L_ORDER", 1);
            SetLocalInt(OBJECT_SELF,"NW_G_CORRECT",1);
            DestroyObject(oItem1, 0.1);
            DestroyObject(oItem2, 0.1);
            effect eSmoke = EffectVisualEffect(VFX_FNF_DISPEL);
            location lSmoke = GetLocation(OBJECT_SELF);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT,eSmoke,lSmoke);
        }
        else
        {
        // * test Purple
            oItem1 = GetItemPossessedBy(OBJECT_SELF,"M3Q2F22POWDER2");
            oItem2 = GetItemPossessedBy(OBJECT_SELF,"M3Q2F22POWDER1");
            if (GetIsObjectValid(oItem1) == TRUE && GetIsObjectValid(oItem2) == TRUE
                && GetLocalInt(OBJECT_SELF,"NW_L_ORDER") == 1)
            {
                oSmoke = CreateObject(OBJECT_TYPE_PLACEABLE, "M3Q2F18_PURPLE", GetLocation(OBJECT_SELF));
                 AssignCommand(oSmoke, DelayCommand(nTime, DestroyObject(OBJECT_SELF)));
               SetLocalInt(OBJECT_SELF,"NW_L_ORDER", 2);
               SetLocalInt(OBJECT_SELF,"NW_G_CORRECT",1);
               DestroyObject(oItem1, 0.1);
               DestroyObject(oItem2, 0.1);
                effect eSmoke2 = EffectVisualEffect(VFX_FNF_DISPEL);
                location lSmoke2 = GetLocation(OBJECT_SELF);
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT,eSmoke2,lSmoke2);
            }
            else
            {
            // * test Green
                oItem1 = GetItemPossessedBy(OBJECT_SELF,"M3Q2F22POWDER3");
                oItem2 = GetItemPossessedBy(OBJECT_SELF,"M3Q2F22POWDER1");
                if (GetIsObjectValid(oItem1) == TRUE && GetIsObjectValid(oItem2) == TRUE
                    && GetLocalInt(OBJECT_SELF,"NW_L_ORDER") == 2)
                {
                   oSmoke = CreateObject(OBJECT_TYPE_PLACEABLE, "M3Q2F18_GREEN", GetLocation(OBJECT_SELF));
                   AssignCommand(oSmoke, DelayCommand(nTime, DestroyObject(OBJECT_SELF)));
                   SetLocalInt(OBJECT_SELF,"NW_L_ORDER", 3);
                   SetLocalInt(OBJECT_SELF,"NW_G_CORRECT",1);
            //       SpeakString("TEMP: Lock Unlocked.  Not implemented.  Bug brent");
                   DecrementLocksOnDoor();
                   DestroyObject(oItem1, 0.1);
                   DestroyObject(oItem2, 0.1);
                    effect eSmoke3 = EffectVisualEffect(VFX_FNF_DISPEL);
                    location lSmoke3 = GetLocation(OBJECT_SELF);
                    ApplyEffectAtLocation(DURATION_TYPE_INSTANT,eSmoke3,lSmoke3);
                    SetPlotFlag(OBJECT_SELF,FALSE);
                    effect eDeath = EffectVisualEffect(VFX_FNF_GAS_EXPLOSION_FIRE);
                    ApplyEffectAtLocation(DURATION_TYPE_INSTANT,eDeath,lSmoke3);
                    DestroyObject(OBJECT_SELF);
                    DestroyObject(GetNearestObjectByTag("MagicSparksPurple"));
                    DestroyObject(GetNearestObjectByTag("MagicSparksOrange"));
                    DestroyObject(GetNearestObjectByTag("MagicSparksGreen"));
                }
            }
        }

        object oItemFirst = OBJECT_INVALID;
        object oItemSecond = OBJECT_INVALID;
        oItemFirst = GetFirstItemInInventory();
        oItemSecond = GetNextItemInInventory();
        if (GetLocalInt(OBJECT_SELF,"NW_G_CORRECT")==0 & oItemSecond != OBJECT_INVALID)
        {
            ActionSpeakStringByStrRef(63287);
        }
        else
        {
           SetLocalInt(OBJECT_SELF,"NW_G_CORRECT",0);
        }
    }
    else
    {
        ActionSpeakStringByStrRef(63287);
    }
}
