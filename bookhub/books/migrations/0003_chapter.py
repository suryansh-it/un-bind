# Generated by Django 5.1.4 on 2024-12-21 06:28

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('books', '0002_rename_created_at_book_download_date_and_more'),
    ]

    operations = [
        migrations.CreateModel(
            name='Chapter',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=255)),
                ('content', models.TextField()),
                ('chapter_number', models.IntegerField()),
                ('order', models.PositiveIntegerField(default=0)),
                ('book', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='chapters', to='books.book')),
            ],
            options={
                'ordering': ['order'],
                'unique_together': {('book', 'order')},
            },
        ),
    ]
