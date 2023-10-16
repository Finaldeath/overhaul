#include "help_general"

void main()
{
    string sTag = GetTag(OBJECT_SELF);

    object oWP = GetNearestObjectByTag("WP_VARH_FIRE");
    location lWP = GetLocation(oWP);

    location l = GetLocation(OBJECT_SELF);

    object oFire = CreateObject(OBJECT_TYPE_PLACEABLE, "plac_lrg_flame", lWP);

    DestroyObject(oFire, 25.0);

    object o = GetNearestObjectByTag(sTag);
    SetPlotFlag(o, FALSE);
    SceneSpeak(o, "[As you knock over the candles, a great flame appears upon the bed...]");
    SetLocalInt(o, "N_DONT_SPEAK", 1);
    DestroyObject(o, 4.0);

    o = OBJECT_SELF;
    SetPlotFlag(o, FALSE);
    SceneSpeak(o, "[As you knock over the candles, a great flame appears upon the bed...]");
    SetLocalInt(o, "N_DONT_SPEAK", 1);
    DestroyObject(o, 4.0);

    if (GetLocalInt(GetPCSpeaker(), "N_VAHR_STATE") == 0)
    {
        object oVarh = GetNearestObjectByTag("CT_UNIQ_SH_VARH");

        AssignCommand(oVarh, ClearAllActions());

        DelayCommand(1.5, AssignCommand(oVarh, ActionMoveToLocation(l)));

        DelayCommand(3.0, AssignCommand(oVarh, JumpToLocation(l)));

        AdjustAlignment(GetPCSpeaker(), ALIGNMENT_CHAOTIC, 5);
    }
}
