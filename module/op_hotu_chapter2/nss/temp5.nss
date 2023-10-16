void main()
{
    CreateObject(OBJECT_TYPE_CREATURE, "q4_guardian", GetLocation(GetFirstPC()));
    CreateItemOnObject("q4d_golemamulet2", GetFirstPC());
}
