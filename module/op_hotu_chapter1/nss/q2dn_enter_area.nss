void main()
{
    if (GetLocalInt(OBJECT_SELF, "nSaveOnce") == 1)
        return;

    SetLocalInt(OBJECT_SELF, "nSaveOnce", 1);
    DoSinglePlayerAutoSave();

}
