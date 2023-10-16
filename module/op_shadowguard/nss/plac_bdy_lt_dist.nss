void main()
{
    if (GetFirstItemInInventory(OBJECT_SELF) == OBJECT_INVALID)
    {
        DestroyObject(OBJECT_SELF);

        object oOwner = GetLocalObject(OBJECT_SELF, "O_MY_OWNER");

        AssignCommand(oOwner, SetIsDestroyable(TRUE, FALSE, FALSE));

        DestroyObject(oOwner, 4.0);
    }
}
