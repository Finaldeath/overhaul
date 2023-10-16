#include "help_general"

void main()
{
    object oPC = GetLastDisturbed();

    if (GetIsPC(oPC))
    {
        object oItem = GetInventoryDisturbItem();

        if (GetStringLeft(GetTag(oItem), 12) == "IT_ST_HENCH_")
        {
            string sSelfTag = GetStringRight(GetTag(OBJECT_SELF), 4);

            string sTag = GetStringRight(GetTag(oItem), 4);

            if (sSelfTag == sTag)
            {
                // CODE OF WHAT TO DO ON MATCH
                object oEnc = GetFirstObjectInArea();

                while (oEnc != OBJECT_INVALID)
                {
                    if (GetTag(oEnc) == "ENC_FALL_ONES_WITS" &&  GetEncounterActive(oEnc) && GetLocalInt(OBJECT_SELF, "N_DESTROYED_ENC") == 0)
                    {
                        SetEncounterActive(FALSE, oEnc);
                        SetLocalInt(OBJECT_SELF, "N_DESTROYED_ENC", 1);
                        TestMessage("[A FALLEN ONE ENCOUNTER WAS DESTROYED]");
                    }

                    oEnc = GetNextObjectInArea();
                }

                if (GetLocalInt(OBJECT_SELF, "N_DESTROYED_ENC") == 0)
                    TestMessage("[NO ENCOUNTER FOUND TO DESTROY]");

                TestMessage("[CORRECT STATUE PLACED IN CHEST]");
            }

            else
            {
                // CODE OF WHAT TO DO ON MISMATCH

                object oEnc = GetFirstObjectInArea();

                while (oEnc != OBJECT_INVALID)
                {
                    if (GetTag(oEnc) == "ENC_FALL_ONES_WITS_INACTIVE" && !(GetEncounterActive(oEnc)) && GetLocalInt(OBJECT_SELF, "N_ACTIVATED_ENC") == 0)
                    {
                        SetEncounterActive(TRUE, oEnc);
                        SetLocalInt(OBJECT_SELF, "N_ACTIVATED_ENC", 1);
                        TestMessage("[INACTIVE ENCOUNTER SET TO ACTIVE]");
                    }

                    oEnc = GetNextObjectInArea();
                }

                if (GetLocalInt(OBJECT_SELF, "N_ACTIVATED_ENC") == 0)
                    TestMessage("[NO INACTIVE ENCOUNTER FOUND TO ACTIVATE]");

                TestMessage("[INCORRECT STATUE PLACED IN CHEST]");
            }

            // ANY WAY GOING, LOCK THE CHEST FOR GOOD
            AssignCommand(OBJECT_SELF, PlayAnimation(ANIMATION_PLACEABLE_CLOSE));

            AssignCommand(OBJECT_SELF, ActionCloseDoor(OBJECT_SELF));

            SetLocked(OBJECT_SELF, TRUE);

            DestroyObject(oItem);

            object oHench = GetNearestObjectByTag("CT_STAT_HC_" + sSelfTag);

            SetLocalInt(oHench, "N_PLAQUE_PLACED", 1);

            AssignCommand(oPC, ClearAllActions());
        }

        else
        {
            TestMessage("[WRONG TYPE OF ITEM PLACED IN SG STATUE CHEST!!]");

            AssignCommand(OBJECT_SELF, ActionGiveItem(oItem, oPC));
        }
    }
}
