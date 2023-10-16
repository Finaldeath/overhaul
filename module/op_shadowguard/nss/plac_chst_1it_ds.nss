void main()
{
    object oPC = GetLastDisturbed();

    if (GetIsPC(oPC))
    {
        AssignCommand(OBJECT_SELF, PlayAnimation(ANIMATION_PLACEABLE_CLOSE));

        SetLocked(OBJECT_SELF, TRUE);

        object o = GetFirstItemInInventory();

        while (o != OBJECT_INVALID)
        {
            DestroyObject(o);

            o = GetNextItemInInventory();
        }

        DestroyObject(OBJECT_SELF, 5.0);
    }
}
