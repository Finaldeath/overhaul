#include "help_general"
#include "help_hench"
#include "nw_i0_generic"

/*
void FallDown(object o)
{
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectKnockdown(), o, 12.0);

        DelayCommand(14.0, AssignCommand(o, ClearAllActions()));
}

void CreateCPHelper(object o, string s)
{
    int n = GetLocalInt(GetModule(), "N_ST_1_CP_ENC_NUMB");
    n++;
    SetLocalInt(GetModule(), "N_ST_1_CP_ENC_NUMB", n);

    object oNew = CreateObject(OBJECT_TYPE_CREATURE, s, GetLocation(o));
    SetLocalInt(oNew, "N_ST_1_CP_ENC", 1);
}

void CreateSpecialDemon()
{
    int n = GetLocalInt(GetModule(), "N_ST_1_CP_ENC_NUMB");
    n++;
    SetLocalInt(GetModule(), "N_ST_1_CP_ENC_NUMB", n);

    string s = "CT_UNIQ_CF_DM_1";
    object o = CreateCreatureOnWP(s, GetFirstPC());
    SetLocalInt(o, "N_ST_1_CP_ENC", 1);
}
*/

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        if (GetFirstTimeIn())
        {
            BeginCutscene(oPC, "sc_st_1_cp_confr", 1, FADE_SPEED_FASTEST);

            /*
            object oWP = GetNearestObjectByTag("WP_PC_MOVE_TO");
            location lWP = GetLocation(oWP);

            AssignCommand(oPC, ClearAllActions());

            AssignCommand(oPC, ActionMoveToLocation(lWP));

            AddJournalSingle("JT_ST_1_MAIN", 16, oPC);

            DelayCommand(0.5, SetCommandable(FALSE, oPC));

            // Cast for cutscene
            object oCP = GetNearestObjectByTag("CT_UNIQ_NT_CRIM");
            object oHarkon = GetNearestObjectByTag("CT_UNIQ_SH_HARK");
            object oMarkius = GetNearestObjectByTag("HENCH_MARK");
            object oLyen = GetNearestObjectByTag("HENCH_LYEN");
            object oKara = GetNearestObjectByTag("HENCH_KARA");
            object oBrukus = GetNearestObjectByTag("HENCH_BRUK");
            object oTarin = GetNearestObjectByTag("HENCH_TARI");

            // for multipurpose use
            object o;

            float offset = 8.0;

            string s;

            int i;

            int j;

            o = oPC;
            s = "[You come upon Markius Albright and his companions, apparently having cornered the Crimson Prophet here within the Docks...]";
            DelayCommand(offset * i++, SceneSpeak(oPC, s));

            o = oHarkon;
            s = "Your days are finished, Prophet!  You shall never leave Ghaarak with that orb!  [Harkon begins gesturing his hands in preparation for a spell...]";
            DelayCommand(offset * i++, SceneSpeak(o, s));
            DelayCommand(offset * i, AssignCommand(o, ActionCastFakeSpellAtObject(SPELL_POWER_WORD_KILL, oCP)));

            o = oCP;
            s = "[As Harkon releases his sorceries upon the Crimson Prophet, a strange magical sphere arises around the red robed figure, stopping the spell before it can reach him...]";
            DelayCommand(offset * i - 0.5, SetPlotFlag(o, FALSE));
            DelayCommand(offset * i, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_GLOBE_INVULNERABILITY), o, offset));
            DelayCommand(offset * i + 0.5, SetPlotFlag(o, TRUE));
            DelayCommand(offset * i++, SceneSpeak(o, s));

            o = oCP;
            s = "Did you truly think that I, the Crimson Prophet, would fall to such a pitiful display of power, fool?!  No!  I'm afraid it is you who shall fall this night!";
            DelayCommand(offset * i++, SceneSpeak(o, s));

            o = oCP;
            s = "[The Crimson Prophet utters a single word, unleashing a power magical blast which sends Harkon reeling to the ground...]";
            DelayCommand(offset * i, SceneSpeak(o, s));

            o = oHarkon;
            DelayCommand(offset * i - 0.5, SetPlotFlag(o, FALSE));
            DelayCommand(offset * i, AssignCommand(oCP, ActionCastFakeSpellAtObject(SPELL_FINGER_OF_DEATH, o)));
            DelayCommand(offset * i + 1.5, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectSleep(), o));
            DelayCommand(offset * i + 2.5, SetPlotFlag(o, TRUE));

            i++;

            o = oMarkius;
            s = "To me, Shadowguard!  The Crimson Prophet must not be allowed to escape!";
            DelayCommand(offset * i++, SceneSpeak(o, s));

            o = oMarkius;
            DelayCommand(offset * i, AssignCommand(o, ActionMoveToObject(oCP, TRUE, 8.0)));

            o = oLyen;
            DelayCommand(offset * i, AssignCommand(o, ActionMoveToObject(oCP, TRUE, 8.0)));

            o = oKara;
            DelayCommand(offset * i, AssignCommand(o, ActionMoveToObject(oCP, TRUE, 8.0)));

            o = oTarin;
            DelayCommand(offset * i, AssignCommand(o, ActionMoveToObject(oCP, TRUE, 8.0)));

            o = oBrukus;
            DelayCommand(offset * i, AssignCommand(o, ActionMoveToObject(oCP, TRUE, 8.0)));

            o = oCP;
            s = "[The Crimson Prophet looks upon his oncoming attackers in disinterest.]  I grow tired of your meddling in my affairs fools!";
            DelayCommand(offset * i, SceneSpeak(o, s));
            DelayCommand(offset * i, AssignCommand(o, ActionCastFakeSpellAtObject(SPELL_STINKING_CLOUD, oMarkius)));

            o = oPC;
            s = "[You see the Crimson Prophet raise his hand in the air, calling for a great cloud of vileness which covers the docks and sends everyone nearby to the ground, reeling in nausea...]";
            DelayCommand(offset * i + 1.0, SceneSpeak(o, s));

            o = GetFirstObjectInArea();

            while (o != OBJECT_INVALID)
            {
                if (GetPlotFlag(o) == FALSE)
                {
                    DelayCommand(offset * i + 0.5, AssignCommand(o, ClearAllActions()));
                    DelayCommand(offset * i + 0.7, FallDown(o));
                }

                o = GetNextObjectInArea();
            }

            i++;

            o = oCP;
            s = "Now, I believe I shall be on my way... but before I do, I shall leave you with some companions to keep you... company...";
            DelayCommand(offset * i++, SceneSpeak(o, s));

            s = "CT_COMM_CF_DM_1";
            o = GetNearestObjectByTag("WP_" + s);

            j = 1;

            while (o != OBJECT_INVALID && GetArea(o) == GetArea(oCP))
            {
                DelayCommand(offset * i, CreateCPHelper(o, s));
                DelayCommand(offset * i, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_GATE), GetLocation(o)));

                j++;

                o = GetNearestObjectByTag("WP_" + s, OBJECT_SELF, j);
            }

            o = oCP;
            s = "Destroy these fools while I escape to my ship!  Let the Sharakhan Empire cower in fear before the might of the Crimson Prophet!";
            DelayCommand(offset * i, SceneSpeak(o, s));
            DelayCommand(offset * i, AssignCommand(o, ActionMoveToObject(GetNearestObjectByTag("DOOR_ST_1_DOCK_DOOR_CP", o), TRUE)));

            DestroyObject(o, offset * i + 6.0);

            o = GetNearestObjectByTag("DOOR_ST_1_DOCK_DOOR_CP", o);
            SetLocked(o, FALSE);
            DelayCommand(offset * i, AssignCommand(o, ActionOpenDoor(o)));

            DelayCommand(offset * i + 3.0, CreateSpecialDemon());

            DelayCommand(offset * i, SetCommandable(TRUE, oPC));
            DelayCommand(offset * i, AddJournalSingle("JT_ST_1_MAIN", 17, oPC));

            o = GetFirstObjectInArea();

            while (o != OBJECT_INVALID)
            {
                if (GetObjectType(o) == OBJECT_TYPE_CREATURE)
                {
                    DelayCommand(offset * i + 2.0, AssignCommand(o, ActionAttack(GetNearestSeenOrHeardEnemy())));

                    s = GetTag(o);

                    if (s == "HENCH_MARK")
                        DelayCommand(offset * i + 3.0, SceneSpeak(o, "The Crimson Prophet is escaping!  Quickly, we must deal with these foul demon spawn he has conjured!"));

                    else if (s == "HENCH_BRUK")
                        DelayCommand(offset * i + 15.0, SceneSpeak(o, "Brukus will smash to bits!"));

                    else if (s == "HENCH_TARI")
                        DelayCommand(offset * i + 20.0, SceneSpeak(o, "I should have just stuck to gambling... far less dangerous than this mess..."));

                    else if (s == "HENCH_KARA")
                        DelayCommand(offset * i + 7.0, SceneSpeak(o, "Akhana take you all!"));

                    else if (s == "HENCH_LYEN")
                        DelayCommand(offset * i + 10.0, SceneSpeak(o, "Death to these unnatural beings!  Let us slay them all!"));
                }

                o = GetNextObjectInArea();
            }
            */
        }
    }
}
