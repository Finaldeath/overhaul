void main()
{
    int n = GetLocalInt(GetPCSpeaker(), "BT_H_INV_MANAGER");

    n++;

    SetLocalInt(GetPCSpeaker(), "BT_H_INV_MANAGER", n);
}
