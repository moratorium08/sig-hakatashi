class HelloController < ApplicationController
    def show
        @message = 'Hello, world'
    end

    def show_days
        render action: 'days'
    end

    def uruu(x)
        if x % 4 == 0 
            if x % 100 == 0 
                if x % 400 == 0 
                    true
                else
                    false
                end
            else
                true
            end
        else 
            false
        end
    end

    # めんどいので
    def kasu(x, y)
        if x > y
            return -kasu(y, x)
        end

        s = 0
        for num in x...y do
            if uruu(num) 
                s += 366
            else
                s += 365
            end
        end
        -s
    end

    def days(y, m, d)
        s = kasu(y, 1994)
        l = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

        m -= 1
        m.times do |i|
            if i == 1 && uruu(y) 
                s += 29
            else
                s += l[i]
            end
        end

        s += d - 1
    end

    def youbi(y, m, d)
        a = days(y, m, d)
        p a
        # base 1994/1/1 -> Saturday
        l = ['土', '日', '月', '火', '水', '木', '金']
        l[a % 7]
    end

    def calc_days
        @year = params[:year].to_i
        @month = params[:month].to_i
        @days = params[:days].to_i
        @day_in_week = youbi(@year, @month, @days)

        render action: 'days'
    end
end
