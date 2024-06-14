void main()
{
    if (GetImmortal(GetLastUsedBy()))
    {
        SendMessageToPC(GetLastUsedBy(), "Destroying the 2 enemies. You are also now mortal. Use again to despawn/sort immortality.");
        SetImmortal(GetLastUsedBy(), FALSE);
        DestroyObject(GetObjectByTag("enemy", 0));
        DestroyObject(GetObjectByTag("enemy", 1));
        return;
    }

    SendMessageToPC(GetLastUsedBy(), "Creating 2 enemies with melee. You are also now immortal. Use again to despawn/sort immortality.");
    SetImmortal(GetLastUsedBy(), TRUE);
    CreateObject(OBJECT_TYPE_CREATURE, "enemy", GetLocation(OBJECT_SELF));
    CreateObject(OBJECT_TYPE_CREATURE, "enemy", GetLocation(OBJECT_SELF));
}
