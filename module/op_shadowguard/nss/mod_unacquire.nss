#include "help_hench"

void main()
{
    object o = GetModuleItemLostBy();
    string sLostByTag = GetTag(o);
    object oItem = GetModuleItemLost();
    string sLostItem = GetResRef(oItem);

    if (GetIsPC(o))
    {
        if (StringToInt(GetStringRight(GetTag(oItem), 3)) >= 900)
        {
            CopyItem(oItem, o);

            SetPlotFlag(oItem, FALSE);
            DestroyObject(oItem);

            SendMessageToPC(o, "[You reconsider throwing aside this item at the moment, and place it back among your belongings.]");
        }

    }

    else if (GetSubString(GetTag(o), 0, 5) == "HENCH" && o != GetLocalObject(GetModule(), "O_MASTER_" + GetTag(o)))
    {
        if (((sLostByTag == "HENCH_KARA") || (sLostByTag == "HENCH_BRUK")
            || (sLostByTag == "HENCH_LYEN") || (sLostByTag == "HENCH_TARI")
            || (sLostByTag == "HENCH_MARK")) &&(sLostItem == "IT_MISC_POTI_012"))
        {
            CreateItemOnObject("IT_MISC_POTI_012", o);
        }

        // to avoid the problem of spawning items on the ground
        if (!(GetIsDead(o)))
        {
            if (!(GetPlotFlag(oItem)))
            {
                object oRef = GetRefHench(o);

                int nStackTracker = GetNumStackedItems(oItem);

                object oInvItem = GetItemPossessedBy(oRef, GetTag(oItem));

                while (oInvItem != OBJECT_INVALID && nStackTracker > 0)
                {
                    if (GetTag(oItem) == GetTag(oInvItem))
                    {
                        nStackTracker -= GetNumStackedItems(oInvItem);

                        DestroyObject(oInvItem);
                    }

                    oInvItem = GetItemPossessedBy(oRef, GetTag(oItem));
                }

                // Do this to ensure that correct number of stacked items are corrected
                if (nStackTracker < 0)
                {
                    nStackTracker = -(nStackTracker);

                    CreateItemOnObject(GetTag(oItem), oRef, nStackTracker);
                }
            }
        }
    }
}
