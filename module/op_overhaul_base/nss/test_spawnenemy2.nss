void main()
{
    if (GetImmortal(GetLastUsedBy()))
    {
        SendMessageToPC(GetLastUsedBy(), "Destroying the mage. You are also now mortal. Use again to despawn/sort immortality.");
        SetImmortal(GetLastUsedBy(), FALSE);
        DestroyObject(GetObjectByTag("mage", 0));
        return;
    }

    SendMessageToPC(GetLastUsedBy(), "Creating mage. You are also now immortal. Use again to despawn/sort immortality.");
    SetImmortal(GetLastUsedBy(), TRUE);
    CreateObject(OBJECT_TYPE_CREATURE, "mage", GetLocation(OBJECT_SELF));
}
