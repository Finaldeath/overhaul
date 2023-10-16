void main()
{
    if(!GetIsNight())
        SetTime(23, 00, 00, 00);
    else
        SetTime(12, 00, 00, 00);
}
