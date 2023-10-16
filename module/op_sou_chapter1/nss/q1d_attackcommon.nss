#include "nw_i0_generic"
void main()
{
            object oShaman = GetObjectByTag("q1dk_shaman");
            object oKobold1 = GetObjectByTag("q1dk_footpad1");
            object oKobold2 = GetObjectByTag("q1dk_footpad2");
            object oKobold3 = GetObjectByTag("q1dk_footpad3");
            object oKobold4 = GetObjectByTag("q1dk_footpad4");
            object oCook = GetObjectByTag("q1dcook");
            object oLodar = GetObjectByTag("q1dlodar");
            object oMob1 = GetObjectByTag("q1dmob1");
            object oMob2 = GetObjectByTag("q1dmob2");
            object oMob3 = GetObjectByTag("q1dmob3");
            object oMob4 = GetObjectByTag("q1dmob4");
            object oMob5 = GetObjectByTag("q1dmob5");
            object oMob6 = GetObjectByTag("q1dmob6");
            object oOldMan = GetObjectByTag("q1d_oldman");

            //Stop ambient sounds
            object oSound1 = GetObjectByTag("snd_q1dmob");
            object oSound2 = GetObjectByTag("snd_q1dscream");
            object oSound3 = GetObjectByTag("snd_q1dyells");
            DestroyObject(oSound1);
            DestroyObject(oSound2);
            DestroyObject(oSound3);

            SetLocalInt(GetArea(OBJECT_SELF), "nCOMMONSATTACKED", 1);
            SetLocalInt(GetModule(), "nCOMMONSATTACKED", 1);
            if (GetLocalInt(OBJECT_SELF, "NW_JOURNAL_ENTRYq1dcook") == 10)
            {
                AddJournalQuestEntry("q1dcook", 50, OBJECT_SELF, TRUE, TRUE);
            }
            ChangeToStandardFaction(oCook, STANDARD_FACTION_HOSTILE);
            ChangeToStandardFaction(oLodar, STANDARD_FACTION_HOSTILE);
            ChangeToStandardFaction(oMob1, STANDARD_FACTION_HOSTILE);
            ChangeToStandardFaction(oMob2, STANDARD_FACTION_HOSTILE);
            ChangeToStandardFaction(oMob3, STANDARD_FACTION_HOSTILE);
            ChangeToStandardFaction(oMob4, STANDARD_FACTION_HOSTILE);
            ChangeToStandardFaction(oMob5, STANDARD_FACTION_HOSTILE);
            ChangeToStandardFaction(oMob6, STANDARD_FACTION_HOSTILE);
            ChangeToStandardFaction(oOldMan, STANDARD_FACTION_HOSTILE);
            //Make the commoners hate the PC
            SetIsTemporaryEnemy(OBJECT_SELF, oCook);
            SetIsTemporaryEnemy(OBJECT_SELF, oLodar);
            SetIsTemporaryEnemy(OBJECT_SELF, oMob1);
            SetIsTemporaryEnemy(OBJECT_SELF, oMob2);
            SetIsTemporaryEnemy(OBJECT_SELF, oMob3);
            SetIsTemporaryEnemy(OBJECT_SELF, oMob4);
            SetIsTemporaryEnemy(OBJECT_SELF, oMob5);
            SetIsTemporaryEnemy(OBJECT_SELF, oMob6);

            //Make the commoners attack the PC
            AssignCommand(oLodar, ActionAttack(OBJECT_SELF));
            AssignCommand(oMob1, ActionAttack(OBJECT_SELF));
            AssignCommand(oMob2, ActionAttack(OBJECT_SELF));
            AssignCommand(oMob3, ActionAttack(OBJECT_SELF));
            AssignCommand(oMob4, ActionAttack(OBJECT_SELF));
            AssignCommand(oMob5, ActionAttack(OBJECT_SELF));
            AssignCommand(oMob6, ActionAttack(OBJECT_SELF));
            AssignCommand(oLodar, DetermineCombatRound());
            AssignCommand(oMob1, DetermineCombatRound());
            AssignCommand(oMob2, DetermineCombatRound());
            AssignCommand(oMob3, DetermineCombatRound());
            AssignCommand(oMob4, DetermineCombatRound());
            AssignCommand(oMob5, DetermineCombatRound());
            AssignCommand(oMob6, DetermineCombatRound());

            //Make everybody hate each other
            SetIsTemporaryEnemy(oCook, oShaman);
            SetIsTemporaryEnemy(oCook, oKobold1);
            SetIsTemporaryEnemy(oCook, oKobold2);
            SetIsTemporaryEnemy(oCook, oKobold3);
            SetIsTemporaryEnemy(oCook, oKobold4);

            SetIsTemporaryEnemy(oLodar, oShaman);
            SetIsTemporaryEnemy(oLodar, oKobold1);
            SetIsTemporaryEnemy(oLodar, oKobold2);
            SetIsTemporaryEnemy(oLodar, oKobold3);
            SetIsTemporaryEnemy(oLodar, oKobold4);

            SetIsTemporaryEnemy(oMob1, oShaman);
            SetIsTemporaryEnemy(oMob1, oKobold1);
            SetIsTemporaryEnemy(oMob1, oKobold2);
            SetIsTemporaryEnemy(oMob1, oKobold3);
            SetIsTemporaryEnemy(oMob1, oKobold4);

            SetIsTemporaryEnemy(oMob2, oShaman);
            SetIsTemporaryEnemy(oMob2, oKobold1);
            SetIsTemporaryEnemy(oMob2, oKobold2);
            SetIsTemporaryEnemy(oMob2, oKobold3);
            SetIsTemporaryEnemy(oMob2, oKobold4);

            SetIsTemporaryEnemy(oMob3, oShaman);
            SetIsTemporaryEnemy(oMob3, oKobold1);
            SetIsTemporaryEnemy(oMob3, oKobold2);
            SetIsTemporaryEnemy(oMob3, oKobold3);
            SetIsTemporaryEnemy(oMob3, oKobold4);

            SetIsTemporaryEnemy(oMob4, oShaman);
            SetIsTemporaryEnemy(oMob4, oKobold1);
            SetIsTemporaryEnemy(oMob4, oKobold2);
            SetIsTemporaryEnemy(oMob4, oKobold3);
            SetIsTemporaryEnemy(oMob4, oKobold4);

            SetIsTemporaryEnemy(oMob5, oShaman);
            SetIsTemporaryEnemy(oMob5, oKobold1);
            SetIsTemporaryEnemy(oMob5, oKobold2);
            SetIsTemporaryEnemy(oMob5, oKobold3);
            SetIsTemporaryEnemy(oMob5, oKobold4);

            SetIsTemporaryEnemy(oMob6, oShaman);
            SetIsTemporaryEnemy(oMob6, oKobold1);
            SetIsTemporaryEnemy(oMob6, oKobold2);
            SetIsTemporaryEnemy(oMob6, oKobold3);
            SetIsTemporaryEnemy(oMob6, oKobold4);

            AssignCommand(oKobold1, ActionAttack(oCook));
            //Freeze the cook so that she stops running
            DelayCommand(2.0, AssignCommand(oCook, ClearAllActions(TRUE)));

            //Kobolds destroy the barricade
            object oTarget = GetObjectByTag("q1d_spelltarget");
            object oBarricade = GetObjectByTag("q1dbaricade_7");


            if (oBarricade != OBJECT_INVALID)
            {
                effect eDamage = EffectDamage(500);
                SetLocalInt(GetArea(OBJECT_SELF), "nKoboldDestroyed", 1);
                DelayCommand(2.0, AssignCommand(oShaman, ActionCastFakeSpellAtObject(SPELL_MAGIC_MISSILE,oTarget)));
                DelayCommand(4.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oBarricade));
            }
            DelayCommand(6.0, AssignCommand(oShaman, ActionAttack(oLodar)));
            DelayCommand(6.0, AssignCommand(oKobold2, ActionAttack(oMob2)));
            DelayCommand(6.0, AssignCommand(oKobold3, ActionAttack(oMob3)));
            DelayCommand(6.0, AssignCommand(oKobold4, ActionAttack(oMob4)));
}
