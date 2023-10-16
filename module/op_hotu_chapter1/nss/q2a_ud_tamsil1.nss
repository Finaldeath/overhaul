//::///////////////////////////////////////////////
//:: Name
//:: FileName  q2a_ud_tamsil
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Tamsil's User Defined
    If the Module's nStartTamsil variable has been set to
    2, then Tamsil is down in the Tavern and a PC has entered
    the area.  The next time there are no PCs present.  She will
    destroy herself and the 'captured' Tamsil will be created.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Nov 7/02
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    int nUser = GetUserDefinedEventNumber();

    if (nUser == 1001)
    {

        if (GetLocalInt(GetModule(), "X2_ypattack") == 2 || GetLocalInt(GetModule(), "X2_ypattack") == 3)
        {
            if (GetLocalInt(OBJECT_SELF, "nUnEquipped") != 1)
            {
                SetLocalInt(OBJECT_SELF, "nUnEquipped", 1);
                object oRHand = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND);
                object oLHand = GetItemInSlot(INVENTORY_SLOT_LEFTHAND);
                if (GetIsObjectValid(oRHand) == TRUE)
                    ActionUnequipItem(oRHand);
                if (GetIsObjectValid(oLHand) == TRUE)
                    ActionUnequipItem(oLHand);
            }
            if (GetLocalInt(OBJECT_SELF, "nRanOff") != 1)
            {
                AssignCommand(OBJECT_SELF, ActionMoveToLocation(GetLocation(GetWaypointByTag("wp_q2atamsil1X"))));
            }
            else
            {
                AssignCommand(OBJECT_SELF, ActionMoveToObject(GetObjectByTag("q2a_yp_int")));

            }
        }


    }
    else if(nUser == 1003) // END OF COMBAT
    {
        if (Random(4) == 1)
        {
            switch (Random(3) + 1)
            {
                case 1: PlaySpeakSoundByStrRef(84054 );
                        break;
                case 2: PlaySpeakSoundByStrRef(84055);
                        break;
                case 3: PlaySpeakSoundByStrRef(84056 );
                        break;
            }
        }
    }

    else if(nUser == 1011) // ON SPELL CAST AT
    {
        if (GetLastSpell() == SPELL_CURE_CRITICAL_WOUNDS || GetLastSpell() == SPELL_CURE_LIGHT_WOUNDS || GetLastSpell() == SPELL_CURE_MINOR_WOUNDS || GetLastSpell() == SPELL_CURE_MODERATE_WOUNDS || GetLastSpell() == SPELL_CURE_SERIOUS_WOUNDS || GetLastSpell() == SPELL_HEAL || GetLastSpell() == SPELL_LESSER_RESTORATION || GetLastSpell() == SPELL_RESTORATION || GetLastSpell() == SPELL_GREATER_RESTORATION)
        {
            PlaySpeakSoundByStrRef(84057 );
            SetLocalInt(OBJECT_SELF, "nDamaged", 0);
        }
    }
}
