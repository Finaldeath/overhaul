void main()
{
    int n = GetLocalInt(OBJECT_SELF, "BT_H_INV_MANAGER");

    n++;

    SetLocalInt(OBJECT_SELF, "BT_H_INV_MANAGER", n);
}
