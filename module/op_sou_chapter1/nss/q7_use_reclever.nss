//::///////////////////////////////////////////////
//:: Name q7_use_reclever
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Pull the recharger lever.
    If the PC has enough money (100 gp) then recharge
    whatever magic item has been placed in the
    recharger.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: March 31/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetLastUsedBy();
    //Does the PC have enough to pay for the new charge he wants
    int nCharges = GetLocalInt(oPC, "X1_Q7ChargesToPayFor") + 1;

    if (GetGold(oPC) >= 100 * nCharges)
    {
        //Play animation on lever.
        int nOpen = GetLocalInt(OBJECT_SELF, "nOPEN");

        if(nOpen == 0)
        {

            SetLocalInt(OBJECT_SELF, "nOPEN", 1);
            ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
        }
        else
        {
            //SetLocked(oDoor, TRUE);
            SetLocalInt(OBJECT_SELF, "nOPEN", 0);
            ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
        }
        object oRecharger = GetObjectByTag("q7recharger");
        // Apply VFX to recharger
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DOOM), oRecharger);

        //Add 1 charge to the item if possible
        object oItem = GetFirstItemInInventory(oRecharger);
        if (oItem != OBJECT_INVALID)
        {
            if (GetItemCharges(oItem) > 0)
            {
                int nChargesOnItem = GetItemCharges(oItem);
                SetItemCharges(oItem, GetItemCharges(oItem) + 1);
                int nNewChargesOnItem = GetItemCharges(oItem);
                if (nNewChargesOnItem > nChargesOnItem)
                    SetLocalInt(oPC, "X1_Q7ChargesToPayFor", GetLocalInt(oPC, "X1_Q7ChargesToPayFor") + 1);
            }
        }
    }
    else
    {
        object oHermit = GetObjectByTag("q7hermit");
        AssignCommand(oHermit, SpeakStringByStrRef(40263));
    }

}
