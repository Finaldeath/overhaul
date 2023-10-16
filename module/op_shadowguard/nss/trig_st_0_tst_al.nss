#include "nw_i0_generic"
#include "help_general"
#include "help_hench"

void DoConsBeamAction(object oCons)
{
    object oAltar = GetLocalObject(oCons, "O_ALTAR");

    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_SILENT_LIGHTNING, oAltar, BODY_NODE_CHEST), oCons);

}

void DoBeamAction(object oAltar)
{
    if (oAltar != OBJECT_INVALID)
    {
        float offset = 6.0;

        object oBeamer1 = GetLocalObject(oAltar, "O_BEAMER_1");

        object oBeamer2 = GetLocalObject(oAltar, "O_BEAMER_2");

        object oAltar1 = GetLocalObject(oAltar, "O_BEAMER_ALTAR_1");

        object oAltar2 = GetLocalObject(oAltar, "O_BEAMER_ALTAR_2");

        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(VFX_BEAM_SILENT_HOLY, oBeamer1, BODY_NODE_CHEST), oAltar, 6.0);

        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(VFX_BEAM_SILENT_HOLY, oBeamer2, BODY_NODE_CHEST), oAltar, 6.0);

        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(VFX_BEAM_LIGHTNING, oAltar1, BODY_NODE_CHEST), oBeamer1, 6.0);

        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(VFX_BEAM_LIGHTNING, oAltar2, BODY_NODE_CHEST), oBeamer2, 6.0);

        DelayCommand(6.0, DoBeamAction(oAltar));
    }
}

void RaiseConstruct(object oCons, object oMarkius)
{
    if (GetLocalObject(oCons, "O_ALTAR") != OBJECT_INVALID)
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectResurrection(), oCons);

        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(GetMaxHitPoints(oCons)), oCons);

        DelayCommand(6.0, AssignCommand(oCons, SpeakString("")));

        SetImmortal(oCons, TRUE);

        DoConsBeamAction(oCons);

        AssignCommand(oCons, DetermineCombatRound(oMarkius));

        if (GetLocalInt(GetModule(), "N_DO_LABYRINTH_CONS_SPEAK_ONCE") == 0)
        {
            SceneSpeak(oCons, "Initializing power reactor...  Hostile targets acquired...  Eliminate all intruders...");

            SceneSpeak(oMarkius, "Be on your guard, " + GetName(GetFirstPC()) + "!  Looks like we're going to have a fight on our hands!");

            SetLocalInt(GetModule(), "N_DO_LABYRINTH_CONS_SPEAK_ONCE", 1);
        }
    }
}

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        if (GetFirstTimeIn())
        {
            object oAltar = GetNearestObjectByTag("ALTAR_ACAD_DOOR");

            object oBeamer;

            oBeamer = GetNearestObjectByTag("PLAC_INVISIBLE", oAltar, 1);

            SetLocalObject(oAltar, "O_BEAMER_1", oBeamer);

            oBeamer = GetNearestObjectByTag("PLAC_S0_ALTAR_SECONDARY", oAltar, 1);

            SetLocalObject(oAltar, "O_BEAMER_ALTAR_1", oBeamer);

            oBeamer = GetNearestObjectByTag("PLAC_INVISIBLE", oAltar, 2);

            SetLocalObject(oAltar, "O_BEAMER_2", oBeamer);

            oBeamer = GetNearestObjectByTag("PLAC_S0_ALTAR_SECONDARY", oAltar, 2);

            SetLocalObject(oAltar, "O_BEAMER_ALTAR_2", oBeamer);

            DoBeamAction(oAltar);

            object o;
            object oWP;
            location lWP;

            int i;

            for (i = 1; i <= 4; i++)
            {
                oAltar = GetNearestObjectByTag("PT_ALTAR", oPC, i);

                oWP = GetNearestObjectByTag("WP_CT_COMM_HS_CONS", oPC, i);

                lWP = GetLocation(oWP);

                o = CreateObject(OBJECT_TYPE_CREATURE, "CT_COMM_HS_CONS", lWP);

                SetLocalObject(o, "O_ALTAR", oAltar);

                SetLocalObject(oAltar, "O_CONSTRUCT", o);

                SetImmortal(o, FALSE);

                SetLocalInt(o, "N_DONT_DESTROY_ON_DEATH", 1);

                SetLocalInt(o, "N_RAISE_WHEN_DEAD", 1);

                ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), o);
            }

            if (GetLocalInt(OBJECT_SELF, "N_DO_CONS_ONCE") == 0)
            {
                int i;

                object oCons;

                for (i = 1; i <= 4; i++)
                {
                    object oMarkius = GetNearestObjectByTag("HENCH_MARK");

                    oCons = GetNearestObjectByTag("CT_COMM_HS_CONS", OBJECT_SELF, i);

                    DelayCommand(i * 0.5, RaiseConstruct(oCons, oMarkius));

                    SetLocalInt(OBJECT_SELF, "N_DO_CONS_ONCE", 1);
                }
            }

            object oKara = GetNearestObjectByTag("HENCH_KARA");

            AssignCommand(oKara, DetermineCombatRound(GetNearestObjectByTag("CT_COMM_HS_CONS", oKara)));

            object oLyen = GetNearestObjectByTag("HENCH_LYEN");

            AssignCommand(oKara, DetermineCombatRound(GetNearestObjectByTag("CT_COMM_HS_CONS", oLyen)));
        }
    }
}
