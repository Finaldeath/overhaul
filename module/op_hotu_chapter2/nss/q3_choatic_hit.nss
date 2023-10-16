// chaotic hit for stealing

void main()
{
    object oPC = GetLastDisturbed();
    if(GetInventoryDisturbType() == INVENTORY_DISTURB_TYPE_REMOVED)
    {
        int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
        if(nDoOnce == 1)
            return;
        SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

        AdjustAlignment(oPC, ALIGNMENT_CHAOTIC, 3);
    }
}
