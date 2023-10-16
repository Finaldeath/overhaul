//Cause Stampede event..

#include "nw_i0_tool"

void Stampede(object oOx)
{
    //object oWP1 = GetWaypointByTag("Q5A_WP_OX1");
    //object oWP2 = GetWaypointByTag("Q5A_WP_OX2");
    object oWP3 = GetWaypointByTag("Q5A_WP_OX3");

    SetLocalInt(oOx, "IGNORE", 1);
    AssignCommand(oOx, ClearAllActions());
    //AssignCommand(oOx, ActionMoveToObject(oWP1, TRUE));
    //AssignCommand(oOx, ActionMoveToObject(oWP2, TRUE));
    AssignCommand(oOx, ActionMoveToObject(oWP3, TRUE));
    AssignCommand(oOx, ActionDoCommand(SetLocalInt(OBJECT_SELF, "IGNORE", 0)));
}

void main()
{
    //int nEvent = GetUserDefinedEventNumber();


    object oPC = GetLastOpenedBy();
    if (oPC == OBJECT_INVALID)
    {
        effect eDamage = EffectDamage(500);
        DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, OBJECT_SELF));
    }
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
         return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    int n = 1;
    object oOx = GetNearestObjectByTag("NW_OX", OBJECT_SELF, 1);
    if(oOx == OBJECT_INVALID)
        return;

    if(GetLevelByClass(CLASS_TYPE_RANGER, oPC) > 0 || GetLevelByClass(CLASS_TYPE_DRUID, oPC))
        AdjustAlignment(oPC, ALIGNMENT_EVIL, 5);

    object oIceHound = GetNearestObjectByTag("Q5_KOBOLD_ICE_HOUND");
    if(oIceHound != OBJECT_INVALID)
    {
        AdjustReputation(oOx, oIceHound, -100);
        AdjustReputation(oIceHound, oOx, -100);
    }

    int nRand;
    string sSound;
    float fDelay = 0.0;
    while(oOx != OBJECT_INVALID)
    {
        n++;
        fDelay += 1.5;
        DelayCommand(fDelay, Stampede(oOx));
        oOx = GetNearestObjectByTag("NW_OX", OBJECT_SELF, n);
        nRand = Random(8) + 1;
        switch(nRand)
        {
            case 1:
                sSound = "as_an_cow1";
                break;
            case 2:
                sSound = "as_an_cow2";
                break;
            case 3:
                sSound = "as_an_cows1";
                break;
            case 4:
                sSound = "as_an_cows2";
                break;
            default:
                sSound = "as_an_cows2";
                break;

        }
        AssignCommand(oPC, PlaySound(sSound));
    }
    if (oPC != OBJECT_INVALID)
    {
    if(AutoDC(DC_EASY, SKILL_TUMBLE, oPC) == FALSE)
        {
            int nDam = d6(3);
            effect eDam = EffectDamage(nDam);
            effect eBump = EffectVisualEffect(VFX_FNF_SCREEN_SHAKE);
            effect eLink = EffectLinkEffects(eDam, eBump);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink, oPC);

            FloatingTextStrRefOnCreature(40406, oPC);
        }
        else // made the tumble check -> play the animation
        {
            AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_DODGE_SIDE));
            FloatingTextStrRefOnCreature(40407, oPC);
        }
        object oWP = GetWaypointByTag("Q5B_WP_TUMBLE");
        DelayCommand(1.0, AssignCommand(oPC, JumpToObject(oWP)));
    }


    object oKlonk = GetNearestObjectByTag("Q5_KLONK");
    if(oKlonk != OBJECT_INVALID)
        SignalEvent(oKlonk, EventUserDefined(101));

    oPC = GetFirstPC();
    {
        GiveXPToCreature(oPC, 200);
        oPC = GetNextPC();
    }



}
