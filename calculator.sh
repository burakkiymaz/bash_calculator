#!/bin/bash                                                                                                                                                                           
sonuc=0                                                                                       
                                                                                              
function init(){                                                                              
        echo -n 'Nasıl işlem yapmak istersin? (Tamsayı [t], Ondalık [o])'                     
        read opt                                                                              
        case $opt in                                                                          
                [Tt])                                                                         
                echo -n sayi 1:
                read sayi1

                echo -n sayi 2:
                read sayi2

        # sayı mı girildi yoksa harf mi girildi bunun denetimi yapılır

                if [[ $sayi1 ==  [A-Z] || $sayi1 == [a-z] ]];
                then
                        echo Sayı 1 Hatalı 0~9 arası giriş yapın...
                        init

                elif [[ $sayi2 == [A-Z] || $sayi2 == [a-z] ]];
                then
                        echo Sayı 2 Hatalı 0~9 arası giriş yapın...
                        init
                else
                        echo check successfull
                fi

        # işlem sorma kısmı
                #Tamsayı toplamı

                echo -n 'Hangi işlemi yapmak istersin? (+,-,*,/) : '
                read islem

                case $islem in
                        [+]|[Tt][Oo][Pp][Ll][Aa])
                                topla
                                ;;
                        [-]|[Çç][Iı][Kk][Aa][Rr])
                                cikar
                                ;;
                        [*]|[Çç][Aa][Rr][Pp])
                                carp
                                ;;
                        [/]|[Bb][Oo][Ll])
                                bol
                                ;;
                esac
                ;;

                #Ondalık işlemler

                [Oo])
                        echo -n 'İşlemi giriniz: '
                        read divIslem
                        ondalik
                        ;;
                *)
        esac

        #Tekrar işlem yapmak ister misin yoksa bu kadar yeter mi?

        echo 'Başka bir işlem yapmak ister misiniz? (E-H):'
        read tekrar

        if [[ $tekrar == [e] || $tekrar == [E] ]];
                then
                init
        elif [[ $tekrar == [h] || $tekrar == [H] ]];
                then
                exit 0
        else
                echo Hatalı giriş
                exit 2
        fi

}

function topla(){
        let "sonuc=sayi1+sayi2"
        echo Sonuc $sonuc
}

function cikar(){
        let "sonuc=sayi1-sayi2"
        echo Sonuc $sonuc
}

function carp(){
        let "sonuc=sayi1*sayi2"
        echo Sonuc $sonuc
}

function bol(){
        let "sonuc=sayi1/sayi2"
        echo Sonuc $sonuc
}

function ondalik(){
        sonuc=`bc -l <<< $divIslem`
        echo Sonuc $sonuc
}


# Program başlatıldı
init
