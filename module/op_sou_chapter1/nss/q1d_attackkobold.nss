#include "nw_i0_generic"
void main()
{
    //SendMessageToPC(GetFirstPC(), "In Attack Kobold script");

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

            //Stop ambient sounds
            object oSound1 = GetObjectByTag("snd_q1dmob");
            object oSound2 = GetObjectByTag("snd_q1dscream");
            object oSound3 = GetObjectByTag("snd_q1dyells");
            DestroyObject(oSound1);
            DestroyObject(oSound2);
            DestroyObject(oSound3);

            SetLocalInt(GetArea(OBJECT_SELF), "nKOBOLDSATTACKED", 1);

            ChangeToStandardFaction(oShaman, STANDARD_FACTION_HOSTILE);
            ChangeToStandardFaction(oKobold1, STANDARD_FACTION_HOSTILE);
            ChangeToStandardFaction(oKobold2, STANDARD_FACTION_HOSTILE);
            ChangeToStandardFaction(oKobold3, STANDARD_FACTION_HOSTILE);
            ChangeToStandardFaction(oKobold4, STANDARD_FACTION_HOSTILE);
            //Make the commoners hate the PC as he should be the one running this script
            SetIsTemporaryEnemy(OBJECT_SELF, oShaman);
            SetIsTemporaryEnemy(OBJECT_SELF, oKobold1);
            SetIsTemporaryEnemy(OBJECT_SELF, oKobold2);
            SetIsTemporaryEnemy(OBJECT_SELF, oKobold3);
            SetIsTemporaryEnemy(OBJECT_SELF, oKobold4);

            //The kobolds will seize the opportunity to kill the cook
            SetIsTemporaryEnemy(oCook, oShaman);
            SetIsTemporaryEnemy(oCook, oKobold1);
            SetIsTemporaryEnemy(oCook, oKobold2);
            SetIsTemporaryEnemy(oCook, oKobold3);
            SetIsTemporaryEnemy(oCook, oKobold4);

            AssignCommand(oKobold1, ActionAttack(oCook));
            //Freeze the cook so that she stops running
            SetCommandable(TRUE, oCook);
            AssignCommand(oCook, ClearAllActions(TRUE));
            //Variable for the cooks heartbeat
            SetLocalInt(GetModule(), "X1_COOKHOSTAGE", 0);

            AssignCommand(oShaman, ActionAttack(OBJECT_SELF));
            AssignCommand(oKobold2, ActionAttack(oMob2));
            AssignCommand(oKobold3, ActionAttack(OBJECT_SELF));
            //destroy the barricade if it is there...
            object oBarricade = GetObjectByTag("q1dbaricade_7");
            if (oBarricade != OBJECT_INVALID)
            {
                AssignCommand(oKobold4, ActionAttack(oMob4));
                effect eDamage = EffectDamage(500);
                DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oBarricade));

            }
            //if the commoners haven't been attacked by the PC- have them attack the kobolds
            if (GetLocalInt(GetArea(OBJECT_SELF), "nCOMMONSATTACKED") != 1)
            {
                SetIsTemporaryEnemy(oShaman, oLodar);
                SetIsTemporaryEnemy(oShaman, oMob1);
                SetIsTemporaryEnemy(oShaman, oMob2);
                SetIsTemporaryEnemy(oShaman, oMob3);
                SetIsTemporaryEnemy(oShaman, oMob4);
                SetIsTemporaryEnemy(oShaman, oMob5);
                SetIsTemporaryEnemy(oShaman, oMob6);

                SetIsTemporaryEnemy(oKobold1, oLodar);
                SetIsTemporaryEnemy(oKobold1, oMob1);
                SetIsTemporaryEnemy(oKobold1, oMob2);
                SetIsTemporaryEnemy(oKobold1, oMob3);
                SetIsTemporaryEnemy(oKobold1, oMob4);
                SetIsTemporaryEnemy(oKobold1, oMob5);
                SetIsTemporaryEnemy(oKobold1, oMob6);

                SetIsTemporaryEnemy(oKobold2, oLodar);
                SetIsTemporaryEnemy(oKobold2, oMob1);
                SetIsTemporaryEnemy(oKobold2, oMob2);
                SetIsTemporaryEnemy(oKobold2, oMob3);
                SetIsTemporaryEnemy(oKobold2, oMob4);
                SetIsTemporaryEnemy(oKobold2, oMob5);
                SetIsTemporaryEnemy(oKobold2, oMob6);

                SetIsTemporaryEnemy(oKobold3, oLodar);
                SetIsTemporaryEnemy(oKobold3, oMob1);
                SetIsTemporaryEnemy(oKobold3, oMob2);
                SetIsTemporaryEnemy(oKobold3, oMob3);
                SetIsTemporaryEnemy(oKobold3, oMob4);
                SetIsTemporaryEnemy(oKobold3, oMob5);
                SetIsTemporaryEnemy(oKobold3, oMob6);

                SetIsTemporaryEnemy(oKobold4, oLodar);
                SetIsTemporaryEnemy(oKobold4, oMob1);
                SetIsTemporaryEnemy(oKobold4, oMob2);
                SetIsTemporaryEnemy(oKobold4, oMob3);
                SetIsTemporaryEnemy(oKobold4, oMob4);
                SetIsTemporaryEnemy(oKobold4, oMob5);
                SetIsTemporaryEnemy(oKobold4, oMob6);

                AssignCommand(oLodar, ActionAttack(oShaman));
                AssignCommand(oMob1, ActionAttack(oKobold3));
                AssignCommand(oMob2, ActionAttack(oShaman));
                AssignCommand(oMob3, ActionAttack(oKobold2));
                AssignCommand(oMob4, ActionAttack(oKobold1));
                AssignCommand(oMob5, ActionAttack(oKobold2));
                AssignCommand(oMob6, ActionAttack(oKobold4));
            }
}
