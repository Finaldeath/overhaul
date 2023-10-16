#include "help_general"

void main()
{
    SetPlotFlag(OBJECT_SELF, FALSE);

    RemoveAllEffects(OBJECT_SELF);

    object oItem = GetItemPossessedBy(GetPCSpeaker(), "IT_PLOT_025");

    object oEquip = GetItemPossessedBy(OBJECT_SELF, "IT_WEAP_BSWO_901");

    int nEquip = INVENTORY_SLOT_RIGHTHAND;

    DestroyObject(oItem);

    AssignCommand(OBJECT_SELF, ActionEquipItem(oEquip, nEquip));

    SetPlotFlag(OBJECT_SELF, TRUE);

    DelayCommand(3.0, MakeStatue(OBJECT_SELF));
}
