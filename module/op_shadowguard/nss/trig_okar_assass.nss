#include "help_general"
#include "help_hench"

void FallDown(object oPC)
{
    AssignCommand(oPC, PlayAnimation(ANIMATION_LOOPING_GET_LOW, 1.0, 12.0));
}

void Assassination(object oPC)
{
    object oWP;
    location lWP;
    effect e;
    int i, iRand;
    float f;
    object o;

    o = GetHenchman(oPC);

    RemoveHenchman(oPC, o);

    o = GetNearestObjectByTag("CT_COMM_SH_GHGD", oPC, 1);
    SetPlotFlag(o, FALSE);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(TRUE), o);

    o = GetNearestObjectByTag("CT_COMM_SH_GHGD", oPC, 2);
    SetPlotFlag(o, FALSE);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(TRUE), o);

    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, e, lWP);

    oWP = GetNearestObjectByTag("WP_OKAR_ASSA_01", oPC);
    lWP = GetLocation(oWP);
    e = EffectVisualEffect(VFX_FNF_FIREBALL);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, e, lWP);

    e = EffectVisualEffect(VFX_FNF_SCREEN_SHAKE);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, e, lWP);

    SceneSpeak(oPC, "[With a tremendous blast, a great ball of fire erupts from within your father's estate, knocking you to the ground and assuredly killing anyone inside...]");

    for (i = 2; i < 10; i++)
    {
        oWP = GetNearestObjectByTag("WP_OKAR_ASSA_0" + IntToString(i), oPC);
        lWP = GetLocation(oWP);

        iRand = Random(4);

        switch (iRand)
        {
            case 0: e = EffectVisualEffect(VFX_FNF_FIREBALL);
                break;

            case 1: e = EffectVisualEffect(VFX_FNF_GAS_EXPLOSION_FIRE);
                break;

            case 2: e = EffectVisualEffect(VFX_FNF_IMPLOSION);
                break;

            default: e = EffectVisualEffect(VFX_FNF_SCREEN_BUMP);
                break;

        }

        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, e, lWP);

        CreateObject(OBJECT_TYPE_PLACEABLE, "plac_lrg_flame", lWP);
        o = GetNearestObjectByTag("SOUN_WIND_BREAK", oPC);

        SoundObjectPlay(o);

        DelayCommand(0.5, DestroyObject(o));
    }

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectKnockdown(), oPC, 12.0);

    DelayCommand(8.0, SceneSpeak(oPC, "[You weakly manage to look up for a moment, as darkness slips over you, to the sight of flames consuming your home.  Your strength failing, your eyes close as you slip deeply into unconciousness...]"));

    DelayCommand(8.0, FadeToBlack(oPC));

//    oWP = GetWaypointByTag("WP_STAGE_1_BEG");
    oWP = GetWaypointByTag("WP_STAGE_1_JUMP");
    lWP = GetLocation(oWP);

    DelayCommand(12.0, AddJournalSingle("JT_ST_0_MAIN", 8, oPC));

    DelayCommand(13.0, SetCommandable(TRUE, oPC));

    DelayCommand(14.2, AssignCommand(oPC, JumpToLocation(lWP)));
}

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        //This script never actually runs. Module Stage gets updated in Help_Hench
        SetLocalInt(GetModule(), "N_MODULE_STAGE", 1);

        if (GetLocalInt(OBJECT_SELF, "N_DO_ONCE") == 0)
        {
            AssignCommand(oPC, ClearAllActions());

            FallDown(oPC);

            DelayCommand(1.5, SetCommandable(FALSE, oPC));

            float offset = 8.0;

            int i = 0;

            DelayCommand(offset * i++, SceneSpeak(oPC, "[You notice a small red medallion lying on the ground before you, and stoop to pick it up.]  I wonder what this is..."));

            if (GetItemPossessedBy(oPC, "IT_PLOT_901") == OBJECT_INVALID)
                CreateItemOnObject("IT_PLOT_901", oPC);

            DelayCommand(offset * i, SceneSpeak(oPC, "[Suddenly, you catch sight of a small plume of smoke go up from the doors of your father's estate, and have a feeling that all is not as it seems...]"));

            object oWP;
            location lWP;
            effect e;

            oWP = GetNearestObjectByTag("WP_OKAR_ASSA_01", oPC);
            lWP = GetLocation(oWP);
            e = EffectVisualEffect(VFX_FNF_SMOKE_PUFF);

            DelayCommand(offset * i++, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, e, lWP));

            DelayCommand(offset * i++, Assassination(oPC));

            DelayCommand(offset * i, SetLocalInt(OBJECT_SELF, "N_DO_ONCE", 1));
        }
    }
}
