// Golem machine disturbed event:
// When all 6 golem parts and amulet are inside:
// 1. Lock the inventory and destroy all objects in it.
// 2. Activate the spell conduits.

void main()
{
    int nType = GetInventoryDisturbType();
    object oItem = GetInventoryDisturbItem();
    object oPC = GetLastDisturbed();
    string sTag = GetTag(oItem);

    if(nType == INVENTORY_DISTURB_TYPE_ADDED)
    {
        if(sTag == "q4d_GolemHead" ||
           sTag == "q4_GolLeftHand" ||
           sTag == "q4_GolRightHand" ||
           sTag == "q4_GolLeftLeg" ||
           sTag == "q4_GolRightLeg" ||
           sTag == "q4_GolemTorso" ||
           sTag == "q4d_GolemAmulet")
        {
            SetItemCursedFlag(oItem, TRUE);
            if(GetItemPossessedBy(OBJECT_SELF, "q4d_GolemHead") != OBJECT_INVALID &&
                GetItemPossessedBy(OBJECT_SELF, "q4_GolLeftHand") != OBJECT_INVALID &&
                GetItemPossessedBy(OBJECT_SELF, "q4_GolRightHand") != OBJECT_INVALID &&
                GetItemPossessedBy(OBJECT_SELF, "q4_GolLeftLeg") != OBJECT_INVALID &&
                GetItemPossessedBy(OBJECT_SELF, "q4_GolRightLeg") != OBJECT_INVALID &&
                GetItemPossessedBy(OBJECT_SELF, "q4_GolemTorso") != OBJECT_INVALID &&
                GetItemPossessedBy(OBJECT_SELF, "q4d_GolemAmulet") != OBJECT_INVALID)
            {
                int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ACTIVATE_ONCE");
                if(nDoOnce == 1)
                    return;
                SetLocalInt(OBJECT_SELF, "DO_ACTIVATE_ONCE", 1);
                SetLocalInt(OBJECT_SELF, "GOT_ALL", 1);
                int i;
                effect eVis = EffectVisualEffect(VFX_DUR_PARALYZED);
                effect eImp = EffectVisualEffect(VFX_IMP_EVIL_HELP);
                object oConduit = GetNearestObjectByTag("q4d_conduit", oPC, i);
                //AssignCommand(oPC, ClearAllActions());
                //AssignCommand(oPC, ActionInteractObject(oConduit));
                while(oConduit != OBJECT_INVALID)
                {
                    SetLocalInt(oConduit, "ACTIVATED", 1);
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, eImp, oConduit);
                    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, oConduit);
                    i++;
                    oConduit = GetNearestObjectByTag("q4d_conduit", oPC, i);
                 }
            }

        }
        else
        {
            DelayCommand(0.3, ActionGiveItem(oItem, oPC));
        }
    }
    else if(GetLocalInt(OBJECT_SELF, "GOT_ALL") == 1)
    {
        DelayCommand(0.3, AssignCommand(oPC, ActionGiveItem(oItem, OBJECT_SELF)));
    }



}
